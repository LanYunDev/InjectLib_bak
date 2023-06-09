require 'json'
require 'fileutils'
require './Utils'
require 'rexml/document'
require 'pathname'
include REXML

def scan_apps
  applist = []
  baseDir = '/Applications'
  lst = Dir.glob("#{baseDir}/*")
  lst.each do |app|
    dir = "#{app}/Contents/Info.plist"
    next unless File.exist?(dir)

    # puts dir
    appInfo = {}

    appInfo['appBaseLocate'] = "#{app}"

    f = File.open(dir, 'r')
    xml_content = f.read
    f.close

    begin
      plist = Document.new(xml_content)
    rescue StandardError
      next
    end
    root = plist.root

    root.elements.each('dict/key') do |element|
      key = element.text
      value = element.next_element.text

      appInfo['CFBundleIdentifier'] = value if key == 'CFBundleIdentifier'
      appInfo['CFBundleVersion'] = value if key == 'CFBundleVersion'
      appInfo['CFBundleShortVersionString'] = value if key == 'CFBundleShortVersionString'
      appInfo['CFBundleName'] = value if key == 'CFBundleName'
    end
    applist.push appInfo
  end
  applist
end

def checkCompatible(compatibleVersionCode, compatibleVersionSubCode, appVersionCode, appSubVersionCode)
  return true if compatibleVersionCode.nil? && compatibleVersionSubCode.nil?
  compatibleVersionCode&.each do |code|
    return true if appVersionCode == code
  end

  compatibleVersionSubCode&.each do |code|
    return true if appSubVersionCode == code
  end
  false
end

def main
  puts "==== 自动注入脚本开始执行 ====\n"
  puts " \tDesign By QiuChenly"
  puts "注入时请根据提示输入。\n"

  install_apps = scan_apps

  config = File.read("config.json")
  config = JSON.parse config
  basePublicConfig = config['basePublicConfig']
  appList = config['AppList']
  appList.each { |app|
    packageName = app['packageName']
    appBaseLocate = app['appBaseLocate']
    bridgeFile = app['bridgeFile']
    dobbyFileName = app['dobbyFileName']
    injectFile = app['injectFile']
    supportVersion = app['supportVersion']
    supportSubVersion = app['supportSubVersion']

    localApp = install_apps.select { |_app| _app['CFBundleIdentifier'] == packageName }
    next if localApp.empty?

    localApp = localApp[0]
    if appBaseLocate.nil?
      appBaseLocate = localApp['appBaseLocate']
    end
    bridgeFile = basePublicConfig['bridgeFile'] if bridgeFile.nil?
    dobbyFileName = basePublicConfig['dobbyFileName'] if dobbyFileName.nil?

    next unless checkCompatible(supportVersion, supportSubVersion, localApp['CFBundleShortVersionString'], localApp['CFBundleVersion'])

    puts "App[#{localApp['CFBundleName']}]符合定义的版本，是否需要注入？y/n\n"
    action = gets.chomp
    next if action != 'y'
    puts "开始注入App: #{packageName}"
    lib = appBaseLocate + bridgeFile

    FileUtils.copy("./tool/" + dobbyFileName, lib + dobbyFileName)

    unless File.exist?(lib + dobbyFileName)
      puts "文件 #{dobbyFileName} 复制失败，取消注入。请使用管理员权限重试。"
      next
    end

    dest = appBaseLocate + bridgeFile + injectFile
    backup = dest + "_backup"

    if File.exist? backup
      puts "备份的注入文件已经存在,需要直接用这个文件注入吗？y/n(y)\n"
      action = gets.chomp
      # action = 'y'
      if action == 'n'
        FileUtils.remove(backup)
        FileUtils.copy(dest, backup)
      else

      end
    else
      FileUtils.copy(dest, backup)
    end

    current = Pathname.new(File.dirname(__FILE__)).realpath
    # set shell +x permission
    sh = "chmod +x #{current}/tool/insert_dylib"
    # puts sh
    system sh
    backup = backup.gsub(" ", "\\ ")
    dest = dest.gsub(" ", "\\ ")
    sh = "sudo #{current}/tool/insert_dylib #{current}/tool/libInjectLib.dylib #{backup} #{dest}"
    # puts sh
    system sh
    sh = "codesign -f -s - #{dest}"
    system sh
    sh = "sudo defaults write /Library/Preferences/com.apple.security.libraryvalidation.plist DisableLibraryValidation -bool true"
    system sh

    system "sudo sh #{current}/tool/pd.sh"
  }
end

main
