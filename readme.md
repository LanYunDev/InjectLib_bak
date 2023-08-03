<!-- TOC -->

* [停更](#停更)
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

| App                                            | 版本              | ARM64 | Intel | 特殊要求                                   |
|:-----------------------------------------------|:----------------|:-----:|:-----:|:---------------------------------------|
| iShot                                          | 2.3.8           |   ✅   |   ✅   |                                        | 
| Infuse Pro                                     | 通杀              |   ✅   |   ✅   |                                        | 
| Parallels Desktop                              | 18.3.2          |   ✅   |   ✅   |                                        | 
| Surge 5                                        | 通杀已经被内鬼举办了，RIP。 |   ❌   |   ❌   | 年度好戏我愿称之为 《窃听风云8:赛博卧底》                 | 
| CleanMyMac X                                   | 4.14.1          |   ✅   |   ✅   | 不要下大陆特供版                               | 
| MWEB Pro                                       | 通杀              |   ✅   |   ✅   |                                        | 
| App Cleaner & Uninstaller                      | 8.2.1           |   ✅   |   ✅   |                                        | 
| 解优2                                            | 1.6.1~通杀        |   ✅   |   ✅   |                                        | 
| Omi录屏专家                                        | 1.3.1~通杀        |   ✅   |   ✅   | 需要从Mac AppStore 下载                     | 
| OmniPlayer                                     | 2.1.0~通杀        |   ✅   |   ✅   | 需要从Mac AppStore 下载                     |
| Navicat Premium                                | 16.1.10～通杀      |   ✅   |   ✅   | 需要从Mac AppStore 下载                     |
| Navicat 16 ForOracle                           | 16.2.4～通杀       |   ❌   |   ✅   | 需要从Mac AppStore 下载 我下不到ARM64的版本        |
| Microsoft Office Word/PowerPoint/Excel/Outlook | 16.75.2 365订阅版  |   ✅   |   ✅   | 需要从Mac AppStore 下载                     |
| Affinity Photo 2/Designer 2/Publisher 2 全家桶    | 2.1.1           |   ✅   |   ✅   | 需要从Mac AppStore 下载 自行测试后提有效/无效报告 我没有安装 |
| ProxyMan                                       | 4.9.0           |   ✅   |   ✅   |                                        |

| Adobe 全家桶               | 版本                                 | ARM64 | Intel | 特殊说明                               |
|:------------------------|:-----------------------------------|:-----:|:-----:|:-----------------------------------|
| Adobe PhotoShop         | 24.6                               |   ❌   |   ✅   | 暂时没有Patch神经滤镜                      |
| Adobe PhotoShop Beta    | 24.7.0 20230612.m.2205 9cfa76c x64 |   ❌   |   ❌   | 支持创意填充/神经滤镜 需要随便登录个账户 出现弹窗关掉继续用就行了 |
| Adobe Acrobat           | 23.003.20215                       |   ✅   |   ✅   |                                    |
| Adobe Illustrator       | 27.6.1                             |   ✅   |   ✅   |                                    |
| Adobe Lightroom Classic | 12.4                               |   ❌   |   ❌   | 功能不可用 等后续更新                        |
| Adobe Premiere Pro      | 23.5                               |   ❔   |   ❔   | M1/x86版本灰度测试 测试报告有效/无效 我没有安装       |

# Surge Paddle系脚本

Surge 更新地址: https://www.nssurge.com/mac/v5/appcast-signed-beta.xml <br>
Surge 最新版地址: https://dl.nssurge.com/mac/v5/Surge-5.2.1-2303-92c83c5d58a046eae6c06c3e82b77afb.zip <br>
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
3. 激活之后由于App还需要依赖我的注入代码，所以不要移动注入文件夹或者删除注入文件夹，有的人用完就把注入文件夹删了，第二天就到处说破解不稳定第二次就崩溃。
   这种人你动动你那个🐷脑子想想为什么第一次能用删了我的注入文件夹第二次打开就崩溃？

# 警告

一定要关闭SIP，因为我使用的注入方式依赖于关闭SIP。

# 交流

别让欲望击穿你の意志

QQGroup: 718372160

# ~~停更~~

~~最近想追个19岁的小妹妹。<br>
项目基本上不会更新了，增加的新项目基本上是工作💻需要才做的。<br>
也不会去维护下面App的新版本了，等我追到手🧑‍🤝‍🧑再说罢！<br>~~

~~为了追💗妹妹👧，MD，跟米哈游原神铁道星穹崩坏王者荣耀蛋仔二次元拼了😡👊！<br>
这下不得不成为农P/原P/穹P了🙏🙏<br>~~

~~无知时诋毁原神🫤🙏<br>
成熟时理解原神😭🙏<br>
恋爱时成为原神😋🙏<br>~~

~~原神助我！喝唉！🖐大荒天陨！️<br>
任何邪恶！终将绳之以法👮！<br>~~

~~原神，启动！~~

失败了，大家别问了。 <br>
她不是不喜欢玩游戏，她只是不喜欢和你玩游戏。
