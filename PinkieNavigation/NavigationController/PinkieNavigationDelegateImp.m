//
//  PinkieNavigationDelegateImp.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieNavigationDelegateImp.h"
#import "PinkiePushAnimatedTransitioning.h"
#import "PinkiePopAnimatedTransitioning.h"

@interface PinkieNavigationDelegateImp ()

@property (nonatomic, assign) BOOL  pushing;

@end

@implementation PinkieNavigationDelegateImp

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.pushing = NO;
}


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return [[PinkiePushAnimatedTransitioning alloc] init];
        
    } else if (operation == UINavigationControllerOperationPop) {
        return [[PinkiePopAnimatedTransitioning alloc] init];
    } else {
        return nil;
    }
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.transitioning.isInteracting ? self.transitioning : nil;
}

@end
