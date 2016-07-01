//
//  TYTumblrHUDTests.m
//  TYTumblrHUDTests
//
//  Created by luckytianyiyan on 06/26/2016.
//  Copyright (c) 2016 luckytianyiyan. All rights reserved.
//

// https://github.com/kiwi-bdd/Kiwi

#import "TYTumblrHUD.h"

SPEC_BEGIN(InitialTests)

describe(@"TYTumblrHUD", ^{
    
    context(@"in life cycle", ^{
        UIViewController *viewController = UIApplication.sharedApplication.keyWindow.rootViewController;
        UIView *view = viewController.view;
        
        TYTumblrHUD *hud = [TYTumblrHUD showHUDAddedTo:view animated:NO];
        it(@"should be created", ^{
            [[hud shouldNot] beNil];
        });
        
        it(@"should be visible", ^{
            [[theValue([view.subviews containsObject:hud]) should] beYes];
        });
        
        it(@"should be found via the convenience operation.", ^{
            [[[TYTumblrHUD HUDForView:view] should] equal:hud];
        });
        
        it(@"should be found and removed.", ^{
            [[theValue([TYTumblrHUD hideHUDForView:view animated:NO]) should] beYes];
        });
    });
});

SPEC_END

