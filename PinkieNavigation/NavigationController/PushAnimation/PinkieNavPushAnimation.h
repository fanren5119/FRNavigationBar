//
//  PinkieNavPushAnimation.h
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PinkieViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PinkieNavPushAnimation : NSObject

@property (nonatomic, assign) float                 duration;
@property (nonatomic, strong) UIViewController      *fromVC;
@property (nonatomic, strong) UIViewController      *toVC;
@property (nonatomic, strong) PinkieViewController  *fromPinkieVC;
@property (nonatomic, strong) PinkieViewController  *toPinkieVC;
@property (nonatomic, assign) float                 screenWidth;

+ (PinkieNavPushAnimation *)create:(UIViewController *)fromVC toVC:(UIViewController *)toVC duration:(float)duration;

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext;

@end

NS_ASSUME_NONNULL_END
