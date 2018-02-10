//
//  TYViewController.m
//  TYTumblrHUD
//
//  Created by luckytianyiyan on 16/6/25.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import "TYViewController.h"
#import <TYTumblrHUD/TYTumblrHUD.h>

@interface TYViewController ()

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UISwitch *colorSwitch;
@property (nonatomic, strong) UIButton *showButton;

@end

@implementation TYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:54 / 255.f green:70 / 255.f blue:92 / 255.f alpha:1];
    
    _textLabel = [[UILabel alloc] init];
    _textLabel.text = @"Change Color";
    _textLabel.textColor = UIColor.whiteColor;
    [self.view addSubview:_textLabel];
    
    _colorSwitch = [[UISwitch alloc] init];
    [self.view addSubview:_colorSwitch];
    
    _showButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_showButton setTitle:@"Show" forState:UIControlStateNormal];
    [_showButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [_showButton addTarget:self action:@selector(showHUD:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_showButton];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat minY = 150.f;
    [_textLabel sizeToFit];
    _textLabel.frame = (CGRect){(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(_textLabel.bounds)) / 2.f,
        minY, _textLabel.bounds.size};
    
    [_colorSwitch sizeToFit];
    _colorSwitch.frame = (CGRect){(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(_colorSwitch.bounds)) / 2.f,
        CGRectGetMaxY(_textLabel.frame) + 10.f,
        _colorSwitch.bounds.size};
    
    [_showButton sizeToFit];
    _showButton.frame = (CGRect){(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(_showButton.bounds)) / 2.f,
        CGRectGetMaxY(_colorSwitch.frame) + 10.f,
        _showButton.bounds.size};
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

// MAKR: - Action

- (void)showHUD:(UIButton *)sender {
    TYTumblrHUD *hud = [TYTumblrHUD showHUDAddedTo:self.view animated:YES];
    if (_colorSwitch.isOn) {
        hud.color = [UIColor colorWithRed:64 / 255.f green:165 / 255.f blue:255 / 255.f alpha:1];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // Dispatch back to the main thread. Always access UI
        // classes on the main thread.
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}

@end
