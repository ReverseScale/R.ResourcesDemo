# R.ResourcesDemo
让你用更优雅且安全的方式管理和使用资源 🤖

> 你是否对 Swift 那套老旧的资源管理模式感到失望，现在介绍一个安全、优雅的新方式管理你的资源。

![](http://og1yl0w9z.bkt.clouddn.com/17-12-18/12691458.jpg)

![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Swift-blue.svg) ![](https://img.shields.io/badge/download-9.9MB-yellow.svg) ![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 


### 🤖 要求

* iOS 9.0+
* Xcode 9.0+
* Swift 4


### 🎨 测试 UI 什么样子？

| 名称 |1.展示页 |2.展示页 |3.展示页 | 4.展示页 |
| ------------- | ------------- | ------------- | ------------- | 
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-12-18/89361876.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-12-18/62199952.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-12-18/94196055.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-12-18/95136487.jpg) | 
| 描述 | 图片素材 | JSON文件 | 字体文件 | 自定义视图 |


### 🎯 安装方法

#### 安装

1.在 *iOS*, 你需要在 Podfile 中添加.
```
pod 'R.swift'
```
然后
```
pod install
```

2.选择项目配置，点击左上角的小加号，添加一个 'New Run Script Phase'

![](http://og1yl0w9z.bkt.clouddn.com/17-12-18/51014466.jpg)

3.将新添加的Script的顺序拖动到compile Sources前面，这步非常重要！

![](http://og1yl0w9z.bkt.clouddn.com/17-12-18/50650865.jpg)

4.在run script中贴进下面的代码：
```
$PODS_ROOT/R.swift/rswift" "$SRCROOT"
```

5.build完成后，会在项目的根目录下发现 'R.generated.swift' 这个文件，将它添加进项目。

> 作者的录像教程：https://vimeo.com/122888912

### 🚀 运行原理

每当项目build时，R.swift开始运行。它会侦测工程文件里包含的资源文件，接着生成一个 R.generated.swift的文件。这个文件根据项目里的资源文件按照类型生成结构体。


### 🛠 配置

#### R.Images

```Swift
//使用R.swift之前
let settingsIcon = UIImage(named: "settings-icon")
let gradientBackground = UIImage(named: "gradient.jpg")
//使用R.swift
let settingsIcon = R.image.settingsIcon
let gradientBackground = R.image.gradientJpg
```

#### R.Storyboards

```Swift
//使用R.swift之前
let storyboard = UIStoryboard(name: "Main", bundle: nil)
let initialTabBarController = storyboard.instantiateInitialViewController() as? UITabBarController
let settingsController = self.instantiateViewControllerWithIdentifier("settingsController") as? SettingsController
//使用R.swift
let storyboard = R.storyboard.main.instance
let initialTabBarController = R.storyboard.main.initialViewController
let settingsController = R.storyboard.main.settingsController
//通过这个代码来校验运行时storyboard的图片是否都能被加载
// 只在debug模式下有效，会通过断言来提示
R.storyboard.main.validateImages()
//在运行时校验所有的viewController能够被正常加载
mode.R.storyboard.main.validateViewControllers()
```

#### R.Segues

```Swift
//使用R.swift之前
performSegueWithIdentifier("openSettings")
//使用R.swift
performSegueWithIdentifier(R.segue.openSettings)
```

#### R.Nibs

```Swift
//使用R.swift之前
let nameOfNib = "CustomView"
let customViewNib = UINib(nibName: "CustomView", bundle: nil)
let rootViews = customViewNib.instantiateWithOwner(nil, options: nil)
let customView = rootViews[0] as? CustomView
let viewControllerWithNib = CustomViewController(nibName: "CustomView", bundle: nil)
//使用R.swift
let nameOfNib = R.nib.customView.name
let customViewNib = R.nib.customView
let rootViews = R.nib.customView.instantiateWithOwner(nil, options: nil)
let customView = R.nib.customView.firstView(nil, options: nil)
let viewControllerWithNib = CustomViewController(nib: R.nib.customView)
```

#### R.cells

```Swift
//使用R.swift之前
let textCellNib = UINib(nibName: "TextCell", bundle: nil) 
tableView.registerNib(textCellNib, forCellReuseIdentifier: "TextCellIdentifier")
//使用R.swift
tableView.registerNib(R.nib.textCell)
//cellForRowAtIndexPath中获取cell
let textCell = tableView.dequeueReusableCellWithIdentifier(R.nib.textCell.reuseIdentifier, forIndexPath: indexPath)
```

#### R.fonts

```Swift
//使用R.swift之前
let lightFontTitle = UIFont(name: "Acme-Light", size: 22)
//使用R.swift
let lightFontTitle = R.font.acmeLight(size: 22)
```

#### R.files

```Swift
//使用R.swift之前
let jsonURL = NSBundle.mainBundle().URLForResource("seed-data", withExtension: "son")
//使用R.swift
let jsonURL = R.file.seedDataJson
```

### 📝 同类对比

和同类型的其他开源库对比的优势

其他同类型的第三方库有： Shark, Natalie , SwiftGen

R.swift的优势有：

* 通过项目文件（Xcodeproj）来检测资源而不是通过扫描文件里的资源
* 支持多种资源类型
* 设计之初接口就希望接近苹果原生API，让你快速上手


### ⚖ 协议

```
MIT License

Copyright (c) 2017 ReverseScale

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

### 😬 联系

* 微信 : WhatsXie
* 邮件 : ReverseScale@iCloud.com
* 博客 : https://reversescale.github.io
