# 命令行版本注入工具使用方法

1. 终端进入本文件夹
2. 执行 sudo ruby main.rb 启动注入程序。

# 最低操作系统要求&代码编译环境

- 最低运行 macOS High Sierra 10.13
- 编译SDK macOS 14.0
- 目标部署平台 macOS 10.13
- CMakeLists 环境变量
    - set(CMAKE_OSX_DEPLOYMENT_TARGET "10.13")

# App兼容性

### 支持以下App的M系和Intel版本：

| App                                            | 版本                   | ARM64 | Intel | 特殊要求               |
|:-----------------------------------------------|:---------------------|:-----:|:-----:|:-------------------|
| iShot                                          | 2.3.5                |   ✅   |   ✅   |                    | 
| Infuse Pro                                     | 通杀                   |   ✅   |   ✅   |                    | 
| Parallels Desktop                              | 18.3.1               |   ✅   |   ✅   |                    | 
| Surge                                          | 5.2.0 2269           |   ✅   |   ✅   |                    | 
| CleanMyMac X                                   | 4.13.4, 4.14.0b1 测试版 |   ✅   |   ✅   | 不要下大陆特供版           | 
| MWEB Pro                                       | 通杀                   |   ✅   |   ✅   |                    | 
| App Cleaner & Uninstaller                      | 8.2                  |   ✅   |   ✅   |                    | 
| 解优2                                            | 1.6.1~通杀             |   ✅   |   ✅   |                    | 
| Omi录屏专家                                        | 1.3.1~通杀             |   ✅   |   ✅   | 需要从Mac AppStore 下载 | 
| Navicat Premium                                | 16.1.10～通杀           |   ✅   |   ✅   | 需要从Mac AppStore 下载 |
| Microsoft Office Word/PowerPoint/Excel/Outlook | 16.74 365订阅版         |   ✅   |   ✅   | 需要从Mac AppStore 下载 |
| Affinity Photo 2/Designer 2/Publisher 2 全家桶    | 2.1.0                |   ✅   |   ✅   | 需要从Mac AppStore 下载 |

| Adobe 全家桶            | 版本                                 | ARM64 | Intel | 特殊说明                  |
|:---------------------|:-----------------------------------|:-----:|:-----:|:----------------------|
| Adobe PhotoShop      | 24.5                               |   ✅   |   ✅   | 暂时没有Patch神经滤镜         |
| Adobe PhotoShop Beta | 24.7.0 20230612.m.2205 9cfa76c x64 |   ✅   |   ✅   | 支持创意填充/神经滤镜 需要随便登录个账户 |
| Adobe Acrobat        | 23.003.20201                       |   ✅   |   ✅   |                       |
| Adobe Illustrator    | 27.6.1                             |   ✅   |   ✅   |                       |

### 提示：

1. 会自动扫描本地安装的App，你只需要在想注入的App后面输入y即可。
2. Adobe App如果不想让官方ACC乱拉屎，可以用这个仓库下载v6版本的离线安装包: https://github.com/Drovosek01/adobe-packager,
   然后配合AntiCC之类的组件运行Adobe产品。

### 警告

一定要关闭SIP，因为我使用的注入方式依赖于关闭SIP。
