//
//  TYAppDelegate.m
//  TYTumblrHUD
//
//  Created by luckytianyiyan on 16/6/25.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import "TYAppDelegate.h"
#import "TYViewController.h"

@interface TYAppDelegate ()

@end

@implementation TYAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[TYViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
