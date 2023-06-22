<!-- TOC -->

* [使用](#使用)
* [环境](#环境)
* [兼容](#兼容)
    * [支持以下App的M系和Intel版本：](#支持以下app的m系和intel版本)
* [Surge Paddle系脚本](#surge-paddle系脚本)
* [提示](#提示)
* [警告](#警告)
* [交流](#交流)

<!-- TOC -->

# 使用

1. 终端进入本文件夹
2. 执行 sudo ruby main.rb 启动注入程序。

# 环境

代码运行最低操作系统要求&此代码编译环境

- 最低运行 macOS High Sierra 10.13
- 编译SDK macOS 14.0
- 目标部署平台 macOS 10.13
- CMakeLists 环境变量
    - set(CMAKE_OSX_DEPLOYMENT_TARGET "10.13")
- 检查二进制文件的最低macOS版本兼容性
    - ```find . -name "*.*" | xargs otool -l | grep -E "(minos|sdk)"```

# 兼容

### 支持以下App的M系和Intel版本：

| App                                            | 版本                   | ARM64 | Intel | 特殊要求               |
|:-----------------------------------------------|:---------------------|:-----:|:-----:|:-------------------|
| iShot                                          | 2.3.5                |   ✅   |   ✅   |                    | 
| Infuse Pro                                     | 通杀                   |   ✅   |   ✅   |                    | 
| Parallels Desktop                              | 18.3.1               |   ✅   |   ✅   |                    | 
| Surge                                          | 5.2.0 2287           |   ✅   |   ✅   |                    | 
| CleanMyMac X                                   | 4.13.4, 4.14.0b1 测试版 |   ✅   |   ✅   | 不要下大陆特供版           | 
| MWEB Pro                                       | 通杀                   |   ✅   |   ✅   |                    | 
| App Cleaner & Uninstaller                      | 8.2                  |   ✅   |   ✅   |                    | 
| 解优2                                            | 1.6.1~通杀             |   ✅   |   ✅   |                    | 
| Omi录屏专家                                        | 1.3.1~通杀             |   ✅   |   ✅   | 需要从Mac AppStore 下载 | 
| OmniPlayer                                     | 2.1.0~通杀             |   ✅   |   ✅   | 需要从Mac AppStore 下载 |
| Navicat Premium                                | 16.1.10～通杀           |   ✅   |   ✅   | 需要从Mac AppStore 下载 |
| Microsoft Office Word/PowerPoint/Excel/Outlook | 16.74.1 365订阅版       |   ✅   |   ✅   | 需要从Mac AppStore 下载 |
| Affinity Photo 2/Designer 2/Publisher 2 全家桶    | 2.1.0                |   ✅   |   ✅   | 需要从Mac AppStore 下载 |
| ProxyMan                                       | 4.8.0                |   ✅   |   ✅   |                    |

| Adobe 全家桶            | 版本                                        | ARM64 | Intel | 特殊说明                               |
|:---------------------|:------------------------------------------|:-----:|:-----:|:-----------------------------------|
| Adobe PhotoShop      | 24.6                                      |   ❌   |   ✅   | 暂时没有Patch神经滤镜                      |
| Adobe PhotoShop Beta | 24.7.0 24.7.0 20230612.m.2205 9cfa76c x64 |   ✅   |   ✅   | 支持创意填充/神经滤镜 需要随便登录个账户 出现弹窗关掉继续用就行了 |
| Adobe Acrobat        | 23.003.20201                              |   ✅   |   ✅   |                                    |
| Adobe Illustrator    | 27.6.1                                    |   ✅   |   ✅   |                                    |
| Adobe Lightroom      | 12.4                                      |   ✅   |   ✅   |                                    |
| Adobe Premiere Pro   | 23.5                                      |   ❌   |   ✅   | 哪儿有M1版本的？官方就没支持吧？                  |

# Surge Paddle系脚本

Surge 最新版地址: https://dl.nssurge.com/mac/v5/Surge-5.2.0-2276-ab78f10c80e6018bad6e296da4db3ba0.zip <br>
Surge开启MitM和脚本功能，然后:

1. 在你的配置文件中加入例子中提供文件中的Script字段信息:
   [Surge脚本配置例子.conf](Surge%E6%BF%80%E6%B4%BB%E8%84%9A%E6%9C%AC%2FSurge%E8%84%9A%E6%9C%AC%E9%85%8D%E7%BD%AE%E4%BE%8B%E5%AD%90.conf)
   ![img.png](imgs/img.png)
   ![img_1.png](imgs/img_1.png)
   ![img_1.png](imgs/img_2.png)

2. [paddle_act.js](Surge%E6%BF%80%E6%B4%BB%E8%84%9A%E6%9C%AC%2Fpaddle_act.js)这个文件一定要复制到conf文件所在目录中。

3. 记得Https解密打开，并且信任证书，MitM域名加入*.paddleapi.com保存即可。
   ![img.png](imgs/img3.png)

4. 在App中随意输入序列号和邮箱，点击激活后秒激活。

已测试支持以下App:

| App         | 版本    | 特殊说明 |
|:------------|:------|:-----|
| AlDente Pro | 1.22  |      |
| AirBuddy    | 2.6.3 |      |

# 提示

1. 会自动扫描本地安装的App，你只需要在想注入的App后面输入y即可。
2. Adobe App如果不想让官方ACC乱拉屎，可以用这个仓库下载v6版本的离线安装包: https://github.com/Drovosek01/adobe-packager,
   然后配合AntiCC之类的组件运行Adobe产品。

# 警告

一定要关闭SIP，因为我使用的注入方式依赖于关闭SIP。

# 交流

别让欲望击穿你の意志

QQGroup: 718372160
