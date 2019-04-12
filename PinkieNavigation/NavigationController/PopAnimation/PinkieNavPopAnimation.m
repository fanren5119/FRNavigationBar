//
//  PinkieNavPopAnimation.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieNavPopAnimation.h"
#import "PinkiePopChangeNavAnimation.h"
#import "PinkiePopHideNavAnimation.h"
#import "PinkiePopShowNavAnimation.h"

@implementation PinkieNavPopAnimation

- (float)screenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}

+ (PinkieNavPopAnimation *)create:(UIViewController *)fromVC toVC:(UIViewController *)toVC duration:(float)duration
{
    PinkieViewController *fromPinkieVC = [self animateVC:fromVC];
    PinkieViewController *toPinkieVC = [self animateVC:toVC];
    
    BOOL fromNavHide = fromPinkieVC.pinkieItem.navigationHidden;
    BOOL toNavHide = toPinkieVC.pinkieItem.navigationHidden;
    
    PinkieNavPopAnimation *popAnimation = nil;
    if (!fromNavHide && !toNavHide) {
        popAnimation = [[PinkiePopChangeNavAnimation alloc] init];
    }
    if (!fromNavHide && toNavHide) {
        popAnimation = [[PinkiePopHideNavAnimation alloc] init];
    }
    if (fromNavHide && !toNavHide) {
        popAnimation = [[PinkiePopShowNavAnimation alloc] init];
    }
    if (fromNavHide && toNavHide) {
        popAnimation = [[PinkieNavPopAnimation alloc] init];
    }
    popAnimation.fromVC = fromVC;
    popAnimation.toVC = toVC;
    popAnimation.fromPinkieVC = fromPinkieVC;
    popAnimation.toPinkieVC = toPinkieVC;
    popAnimation.duration = duration;
    return popAnimation;
}

+ (PinkieViewController *)animateVC:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UITabBarController class]]) {
        UIViewController *selectVC = ((UITabBarController *)vc).selectedViewController;
        if ([selectVC isKindOfClass:[PinkieViewController class]]) {
            return (PinkieViewController *)selectVC;
        } else {
            return nil;
        }
    }
    if ([vc isKindOfClass:[PinkieViewController class]]) {
        return (PinkieViewController *)vc;
    } else {
        return nil;
    }
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    [self viewAnimatePrepare:transitionContext];
    [self navigationViewPerpare];
    
    [UIView animateWithDuration:self.duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self viewAnimation];
        [self naviationViewAnimate];
    } completion:^(BOOL finished) {
        BOOL cancel = transitionContext.transitionWasCancelled;
        if (cancel) {
            [self.toVC.view removeFromSuperview];
        } else {
            [self.fromVC.view removeFromSuperview];
        }
        [self navigationViewAnimateComplete:cancel];
        [transitionContext completeTransition:!cancel];
    }];
}

- (void)viewAnimatePrepare:(id<UIViewControllerContextTransitioning>)context
{
    [context.containerView addSubview:self.toVC.view];
    self.toVC.view.frame = context.containerView.bounds;
    
    CGRect rect = self.toVC.view.frame;
    rect.origin.x = -self.screenWidth;
    self.toVC.view.frame = rect;
}

- (void)viewAnimation
{
    CGRect fromRect = self.fromVC.view.frame;
    fromRect.origin.x = self.screenWidth;
    self.fromVC.view.frame = fromRect;
    
    CGRect toRect = self.toVC.view.frame;
    toRect.origin.x = 0;
    self.toVC.view.frame = toRect;
}

- (void)navigationViewPerpare
{
    
}

- (void)naviationViewAnimate
{
    
}

- (void)navigationViewAnimateComplete:(BOOL)cancel
{
    
}

@end
