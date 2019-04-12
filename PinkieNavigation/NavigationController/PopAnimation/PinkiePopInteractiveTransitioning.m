//
//  PinkiePopInteractiveTransitioning.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkiePopInteractiveTransitioning.h"

@implementation PinkiePopInteractiveTransitioning

- (void)setNavigationController:(UINavigationController *)navigationController
{
    _navigationController = navigationController;
    
    UIScreenEdgePanGestureRecognizer *gesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToGesture:)];
    gesture.edges = UIRectEdgeLeft;
    [navigationController.view addGestureRecognizer:gesture];
}

- (void)respondsToGesture:(UIGestureRecognizer *)gesture
{
    CGPoint point = [gesture locationInView:gesture.view];
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat scale = point.x / screenWidth;
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.isInteracting = YES;
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self updateInteractiveTransition:scale];
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
        {
            self.isInteracting = NO;
            if (scale > 0.5) {
                [self finishInteractiveTransition];
            } else {
                [self cancelInteractiveTransition];
            }
        }
        default:
            break;
    }
}

@end
