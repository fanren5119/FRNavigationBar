//
//  PinkiePopAnimatedTransitioning.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkiePopAnimatedTransitioning.h"
#import "PinkieNavPopAnimation.h"

@implementation PinkiePopAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.2;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    PinkieNavPopAnimation *animate = [PinkieNavPopAnimation create:fromVC toVC:toVC duration:0.2];
    [animate animateTransition:transitionContext];
}

@end
