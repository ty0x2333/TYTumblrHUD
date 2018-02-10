//
//  TYTumblrHUD.m
//  TYTumblrHUD
//
//  Created by luckytianyiyan on 16/6/25.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import "TYTumblrHUD.h"

static CGFloat const kSubLayerWidth = 15.f;
static CGFloat const kSubLayerHeight = 16.5f;
static CGFloat const kSubLayerInterval = 5.f;
static CGFloat const kSubLayerCornerRadius = 3.f;
static CGFloat const kSubLayerAlpha = .5f;

static CGFloat const kSubLayerMaxDuration = .25f;
static CGFloat const kSubLayerMinDuration = .15f;

static CGFloat const kHUDAnimationDuration = .3f;

static NSInteger const kSubLayerCount = 3;

@interface TYTumblrHUD()

@property (nonatomic, strong) NSArray<CALayer *> *subLayers;

@end

@implementation TYTumblrHUD

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.backgroundColor = [UIColor clearColor];
    self.alpha = 0;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    _color = [UIColor colorWithRed:241 / 255.f green:242 / 255.f blue:243 / 255.f alpha:1.f];
    
    NSMutableArray *subLayers = [NSMutableArray arrayWithCapacity:kSubLayerCount];
    CGFloat offsetDuration = (kSubLayerMaxDuration - kSubLayerMinDuration) / kSubLayerCount;
    CGFloat groupAnimationDuration = 0;
    
    for (NSInteger i = 0; i < kSubLayerCount; ++i) {
        CALayer *subLayer = [[CALayer alloc] init];
        subLayer.backgroundColor = _color.CGColor;
        subLayer.cornerRadius = kSubLayerCornerRadius;
        subLayer.opacity = kSubLayerAlpha;
        [self.layer addSublayer:subLayer];
        [subLayers addObject:subLayer];
        
        groupAnimationDuration += kSubLayerMinDuration + i * offsetDuration;
    }
    _subLayers = [subLayers copy];
    
    CGFloat beginTimeOffset = 0;
    for (NSInteger i = 0; i < kSubLayerCount; ++i) {
        CALayer *subLayer = _subLayers[i];

        CGFloat animationDuration = kSubLayerMinDuration + i * offsetDuration;
        CGFloat repeatDuration = groupAnimationDuration;
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.duration = groupAnimationDuration + repeatDuration;

        CABasicAnimation *animationAlpha = [CABasicAnimation animationWithKeyPath:@"opacity"];
        animationAlpha.duration = animationDuration;
        animationAlpha.fromValue = @(kSubLayerAlpha);
        animationAlpha.toValue = @(1.f);
        animationAlpha.autoreverses = YES;

        CABasicAnimation *animationSize = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
        animationSize.duration = animationDuration;
        animationSize.fromValue = @(1.f);
        animationSize.toValue = @(1.3f);
        animationSize.autoreverses = YES;

        animationGroup.animations = @[animationAlpha, animationSize];
        animationGroup.repeatCount = HUGE_VALF;
        animationGroup.beginTime = CACurrentMediaTime() + beginTimeOffset;
        animationGroup.removedOnCompletion = NO;
        [subLayer addAnimation:animationGroup forKey:@""];

        beginTimeOffset += animationDuration;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat sumOfSubLayersWidth = kSubLayerCount * kSubLayerWidth + (kSubLayerCount - 1) * kSubLayerInterval;
    CGFloat originX = (CGRectGetWidth(self.bounds) - sumOfSubLayersWidth) / 2;
    CGFloat minY = (CGRectGetHeight(self.bounds) - kSubLayerHeight) / 2;
    for (NSInteger i = 0; i < kSubLayerCount; ++i) {
        CALayer *subLayer = _subLayers[i];
        subLayer.frame = CGRectMake(originX + i * (kSubLayerWidth + kSubLayerInterval), minY, kSubLayerWidth, kSubLayerHeight);
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat sumOfSubLayersWidth = kSubLayerCount * kSubLayerWidth + (kSubLayerCount - 1) * kSubLayerInterval;
    return CGSizeMake(sumOfSubLayersWidth, kSubLayerHeight);
}

- (void)showAnimated:(BOOL)animated {
    NSAssert([NSThread isMainThread], @"TYTumblrHUD needs to be accessed on the main thread.");
    [self p_animateIn:YES animated:animated completion:nil];
}

- (void)hideAnimated:(BOOL)animated {
    NSAssert([NSThread isMainThread], @"TYTumblrHUD needs to be accessed on the main thread.");
    [self p_animateIn:NO animated:animated completion:^(BOOL finished) {
        if (_removeFromSuperViewOnHide) {
            [self removeFromSuperview];
        }
    }];
}

- (void)setColor:(UIColor *)color {
    _color = color;
    for (CALayer *layer in _subLayers) {
        layer.backgroundColor = _color.CGColor;
    }
}

#pragma mark - Class Methods

+ (instancetype)showHUDAddedTo:(UIView *)view animated:(BOOL)animated {
    TYTumblrHUD *hud = [[self alloc] initWithFrame:view.bounds];
    hud.removeFromSuperViewOnHide = YES;
    [view addSubview:hud];
    [hud showAnimated:animated];
    return hud;
}

+ (BOOL)hideHUDForView:(UIView *)view animated:(BOOL)animated {
    TYTumblrHUD *hud = [self HUDForView:view];
    if (hud != nil) {
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:animated];
        return YES;
    }
    return NO;
}

+ (TYTumblrHUD *)HUDForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (TYTumblrHUD *)subview;
        }
    }
    return nil;
}

#pragma mark - Helper

- (void)p_animateIn:(BOOL)animatingIn animated:(BOOL)animated completion:(void(^)(BOOL finished))completion {
    if (animated) {
        [UIView animateWithDuration:kHUDAnimationDuration animations:^{
            self.alpha = animatingIn ? 1.f : 0;
        } completion:completion];
    } else {
        self.alpha = animatingIn ? 1.f : 0;
    }
}

@end
