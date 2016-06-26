//
//  TYTumblrHUD.m
//  TYTumblrHUD
//
//  Created by luckytianyiyan on 16/6/25.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

#import "TYTumblrHUD.h"

#define TYTumblrBackgroundColor [UIColor colorWithRed:241 / 255.f green:242 / 255.f blue:243 / 255.f alpha:1.f]
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

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.backgroundColor = [UIColor clearColor];
    self.alpha = 0;
    
    NSMutableArray *subLayers = [NSMutableArray arrayWithCapacity:kSubLayerCount];
    CGFloat offsetDuration = (kSubLayerMaxDuration - kSubLayerMinDuration) / kSubLayerCount;
    CGFloat groupAnimationDuration = 0;
    
    for (NSInteger i = 0; i < kSubLayerCount; ++i) {
        CALayer *subLayer = [[CALayer alloc] init];
        subLayer.backgroundColor = TYTumblrBackgroundColor.CGColor;
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

- (void)layoutSublayersOfLayer:(CALayer *)layer
{
    [super layoutSublayersOfLayer:layer];
    if (layer != self.layer) {
        return;
    }
    CGFloat sumOfSubLayersWidth = kSubLayerCount * kSubLayerWidth + (kSubLayerCount - 1) * kSubLayerInterval;
    CGFloat originX = (CGRectGetWidth(self.bounds) - sumOfSubLayersWidth) / 2;
    for (NSInteger i = 0; i < kSubLayerCount; ++i) {
        CALayer *subLayer = _subLayers[i];
        subLayer.frame = CGRectMake(originX + i * (kSubLayerWidth + kSubLayerInterval), 0, kSubLayerWidth, kSubLayerHeight);
    }
}

- (void)showAnimated:(BOOL)animated
{
    [self p_animateIn:YES animated:animated completion:nil];
}

- (void)hideAnimated:(BOOL)animated
{
    [self p_animateIn:NO animated:animated completion:^(BOOL finished) {
        if (_removeFromSuperViewOnHide) {
            [self removeFromSuperview];
        }
    }];
}

#pragma mark - Helper

- (void)p_animateIn:(BOOL)animatingIn animated:(BOOL)animated completion:(void(^)(BOOL finished))completion
{
    if (animated) {
        [UIView animateWithDuration:kHUDAnimationDuration animations:^{
            self.alpha = animatingIn ? 1.f : 0;
        } completion:completion];
    } else {
        self.alpha = animatingIn ? 1.f : 0;
    }
}

@end
