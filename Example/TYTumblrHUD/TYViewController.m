//
//  TYViewController.m
//  TYTumblrHUD
//
//  Created by luckytianyiyan on 16/6/25.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import "TYViewController.h"
#import "UIColor+TYTheme.h"
#import <TYTumblrHUD/TYTumblrHUD.h>

@interface TYViewController ()

@end

@implementation TYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor ty_background];
    
    TYTumblrHUD *hud = [TYTumblrHUD showHUDAddedTo:self.view animated:YES];
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        sleep(3.f);
        // Dispatch back to the main thread. Always access UI
        // classes on the main thread.
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
        
        sleep(1.f);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [TYTumblrHUD showHUDAddedTo:self.view animated:YES];
        });
        
    });
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
