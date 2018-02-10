```
__ __| \ \   / __ __|                  |      |        |   |  |   |  __ \ 
   |    \   /     |  |   |  __ `__ \   __ \   |   __|  |   |  |   |  |   |
   |       |      |  |   |  |   |   |  |   |  |  |     ___ |  |   |  |   |
  _|      _|     _| \__,_| _|  _|  _| _.__/  _| _|    _|  _| \___/  ____/

```

[![CI Status](https://img.shields.io/travis/luckytianyiyan/TYTumblrHUD.svg?maxAge=2592000)](https://travis-ci.org/luckytianyiyan/TYTumblrHUD)
[![Version](https://img.shields.io/cocoapods/v/TYTumblrHUD.svg?style=flat)](http://cocoapods.org/pods/TYTumblrHUD)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![codebeat badge](https://codebeat.co/badges/a04ad46a-462b-4975-a2e0-af93d03b8665)](https://codebeat.co/projects/github-com-luckytianyiyan-tytumblrhud-master)
[![License](https://img.shields.io/cocoapods/l/TYTumblrHUD.svg?style=flat)](http://cocoapods.org/pods/TYTumblrHUD)
[![Platform](https://img.shields.io/cocoapods/p/TYTumblrHUD.svg?style=flat)](http://cocoapods.org/pods/TYTumblrHUD)

Progress HUD like [Tumblr](https://www.tumblr.com/). API style like [MBProgressHUD](https://github.com/jdg/MBProgressHUD).

Example
---

To run the example project, clone the repo, and run `pod install` from the Example directory first.

<img src="README_IMAGES/Example.gif" width="320" />

Installation
---

#### CocoaPods
**TYTumblrHUD** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TYTumblrHUD"
```

#### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:
````
$ brew update
$ brew install carthage
````
To integrate **TYTumblrHUD** into your Xcode project using Carthage, specify it in your `Cartfile`:
````
github "luckytianyiyan/TYTumblrHUD"
````
Run `carthage` to build the framework and drag the built `TYTumblrHUD.framework` into your Xcode project.

Usage
---
```objective-c
TYTumblrHUD *hud = [TYTumblrHUD showHUDAddedTo:self.view animated:YES];

dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
    // do something ...

    dispatch_async(dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
    });
});
```

License
---

`TYTumblrHUD` is available under the MIT license. See the LICENSE file for more info.
