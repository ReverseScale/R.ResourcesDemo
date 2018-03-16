# R.ResourcesDemo
Lets you manage and use resources in a more elegant and secure manner

![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Swift-blue.svg) ![](https://img.shields.io/badge/download-9.9MB-yellow.svg) ![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

[EN](#Requirements) | [中文](#中文说明)

> If you're disappointed with Swift's old resource management model, now introduce a safe and elegant new way to manage your resources.

![](http://og1yl0w9z.bkt.clouddn.com/17-12-18/12691458.jpg)

## 🤖 Requirements 
* iOS 9.0+
* Xcode 9.0+
* Swift 4

## 🎨 What does the test UI look like?

|1.Presentation page | 2.Presentation page | 3.Presentation page | 4.Presentation page |
| ------------- | ------------- | ------------- | ------------- | 
| ![](http://og1yl0w9z.bkt.clouddn.com/18-3-16/9534579.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-16/45137205.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-16/76876858.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-16/94863276.jpg) | 
| Picture material | JSON file | Font file | Custom view |

## 🚀 Operating principle

Whenever the project builds, R.swift runs. It will detect the resource files contained in the project file and then generate a R.generated.swift file. This file generates structures by type based on the resource files in the project.


## 🛠 Usage
#### Install

1. In *iOS*, you need to add in Podfile.
```
pod 'R.swift'
```
then
```
pod install
```

2. Select the project configuration, click on the small plus sign in the upper left corner, add a 'New Run Script Phase'

![](http://og1yl0w9z.bkt.clouddn.com/17-12-18/51014466.jpg)

3. Drag the order of the newly added script to the front of compile Sources. This step is very important!

![](http://og1yl0w9z.bkt.clouddn.com/17-12-18/50650865.jpg)

4. In the run script paste the following code:
```
$PODS_ROOT/R.swift/rswift" "$SRCROOT"
```

5. After the build is complete, the 'R.generated.swift' file will be found in the root directory of the project and added to the project.

> The author's video tutorial:https://vimeo.com/122888912

#### R.Images

```Swift
// Before using R.swift
let settingsIcon = UIImage(named: "settings-icon")
let gradientBackground = UIImage(named: "gradient.jpg")
// use R.swift
let settingsIcon = R.image.settingsIcon
let gradientBackground = R.image.gradientJpg
```

#### R.Storyboards

```Swift
// Before using R.swift
let storyboard = UIStoryboard(name: "Main", bundle: nil)
let initialTabBarController = storyboard.instantiateInitialViewController() as? UITabBarController
let settingsController = self.instantiateViewControllerWithIdentifier("settingsController") as? SettingsController
// use R.swift
let storyboard = R.storyboard.main.instance
let initialTabBarController = R.storyboard.main.initialViewController
let settingsController = R.storyboard.main.settingsController
// This code to verify whether the picture of the runtime storyboard can be loaded
// Valid only in debug mode, will be prompted by assertions
R.storyboard.main.validateImages()
// Verify that all viewControllers are loaded normally at runtime
mode.R.storyboard.main.validateViewControllers()
```

#### R.Segues

```Swift
// Before using R.swift
performSegueWithIdentifier("openSettings")
// use R.swift
performSegueWithIdentifier(R.segue.openSettings)
```

#### R.Nibs

```Swift
// Before using R.swift
let nameOfNib = "CustomView"
let customViewNib = UINib(nibName: "CustomView", bundle: nil)
let rootViews = customViewNib.instantiateWithOwner(nil, options: nil)
let customView = rootViews[0] as? CustomView
let viewControllerWithNib = CustomViewController(nibName: "CustomView", bundle: nil)
// use R.swift
let nameOfNib = R.nib.customView.name
let customViewNib = R.nib.customView
let rootViews = R.nib.customView.instantiateWithOwner(nil, options: nil)
let customView = R.nib.customView.firstView(nil, options: nil)
let viewControllerWithNib = CustomViewController(nib: R.nib.customView)
```

#### R.cells

```Swift
// Before using R.swift
let textCellNib = UINib(nibName: "TextCell", bundle: nil) 
tableView.registerNib(textCellNib, forCellReuseIdentifier: "TextCellIdentifier")
// use R.swift
tableView.registerNib(R.nib.textCell)
// cellForRowAtIndexPath gets cell
let textCell = tableView.dequeueReusableCellWithIdentifier(R.nib.textCell.reuseIdentifier, forIndexPath: indexPath)
```

#### R.fonts

```Swift
// Before using R.swift
let lightFontTitle = UIFont(name: "Acme-Light", size: 22)
// use R.swift
let lightFontTitle = R.font.acmeLight(size: 22)
```

#### R.files

```Swift
// Before using R.swift
let jsonURL = NSBundle.mainBundle().URLForResource("seed-data", withExtension: "son")
// use R.swift
let jsonURL = R.file.seedDataJson
```

### 📝 Similar comparison

Advantages compared to other open source libraries of the same type

Other third-party libraries of the same type include: Shark, Natalie , SwiftGen

The advantages of R.swift are:

* Detect resources through project files (Xcodeproj) instead of scanning for resources in files
* Support multiple resource types
* At the beginning of the design, I hope to get close to Apple's native API and let you quickly get started

## ⚖ Protocol
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

##  😬 Contact:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io

---
# 中文说明

让你用更优雅且安全的方式管理和使用资源 🤖

> 你是否对 Swift 那套老旧的资源管理模式感到失望，现在介绍一个安全、优雅的新方式管理你的资源。

![](http://og1yl0w9z.bkt.clouddn.com/17-12-18/12691458.jpg)

## 🤖 要求

* iOS 9.0+
* Xcode 9.0+
* Swift 4

## 🚀 运行原理

每当项目build时，R.swift开始运行。它会侦测工程文件里包含的资源文件，接着生成一个 R.generated.swift的文件。这个文件根据项目里的资源文件按照类型生成结构体。

## 🎨 测试 UI 什么样子？

|1.展示页 |2.展示页 |3.展示页 | 4.展示页 |
| ------------- | ------------- | ------------- | ------------- | 
| ![](http://og1yl0w9z.bkt.clouddn.com/18-3-16/9534579.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-16/45137205.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-16/76876858.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-16/94863276.jpg) | 
| 图片素材 | JSON文件 | 字体文件 | 自定义视图 |


## 🛠 安装方法

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

## 📝 同类对比

和同类型的其他开源库对比的优势

其他同类型的第三方库有： Shark, Natalie , SwiftGen

R.swift的优势有：

* 通过项目文件（Xcodeproj）来检测资源而不是通过扫描文件里的资源
* 支持多种资源类型
* 设计之初接口就希望接近苹果原生API，让你快速上手

## ⚖ 协议

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


## 😬 联系方式:
* 微信 : WhatsXie
* 邮箱 : ReverseScale@iCloud.com
* 博客 : https://reversescale.github.io
