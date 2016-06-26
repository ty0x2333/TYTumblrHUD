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
    TYTumblrHUD *hud = [[TYTumblrHUD alloc] init];
    hud.center = self.view.center;
    [self.view addSubview:hud];
    
    [hud showAnimated:YES];
}

@end
