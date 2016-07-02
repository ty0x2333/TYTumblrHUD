```
__ __| \ \   / __ __|                  |      |        |   |  |   |  __ \  
   |    \   /     |  |   |  __ `__ \   __ \   |   __|  |   |  |   |  |   |
   |       |      |  |   |  |   |   |  |   |  |  |     ___ |  |   |  |   |
  _|      _|     _| \__,_| _|  _|  _| _.__/  _| _|    _|  _| \___/  ____/  

```

[![CI Status](https://travis-ci.com/luckytianyiyan/TYTumblrHUD.svg?token=KxwDz7Dpc3VEyK4zS63h)](https://travis-ci.com/luckytianyiyan/TYTumblrHUD)
[![Version](https://img.shields.io/cocoapods/v/TYTumblrHUD.svg?style=flat)](http://cocoapods.org/pods/TYTumblrHUD)
[![License](https://img.shields.io/cocoapods/l/TYTumblrHUD.svg?style=flat)](http://cocoapods.org/pods/TYTumblrHUD)
[![Platform](https://img.shields.io/cocoapods/p/TYTumblrHUD.svg?style=flat)](http://cocoapods.org/pods/TYTumblrHUD)

Progress HUD like [Tumblr](https://www.tumblr.com/). API style is like [MBProgressHUD](https://github.com/jdg/MBProgressHUD).

Example
---

To run the example project, clone the repo, and run `pod install` from the Example directory first.

<img src="README_IMAGES/Example.gif" width="320" />

Installation
---

TYTumblrHUD is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TYTumblrHUD"
```

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
