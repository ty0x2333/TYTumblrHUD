//
//  TYTumblrHUD.h
//  TYTumblrHUD
//
//  Created by luckytianyiyan on 16/6/25.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYTumblrHUD : UIView

@property (nonatomic, assign) BOOL removeFromSuperViewOnHide;

+ (instancetype)showHUDAddedTo:(UIView *)view animated:(BOOL)animated;

- (void)showAnimated:(BOOL)animated;

- (void)hideAnimated:(BOOL)animated;

@end
