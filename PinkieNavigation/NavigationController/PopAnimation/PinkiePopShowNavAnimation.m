//
//  PinkiePopShowNavAnimation.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkiePopShowNavAnimation.h"
#import "PinkieNavigationView.h"
#import "PinkieNavigationController.h"

@interface PinkiePopShowNavAnimation ()

@property (nonatomic, strong) PinkieNavigationView  *navigationView;

@end

@implementation PinkiePopShowNavAnimation

- (void)navigationViewPerpare
{
    PinkieNavigationController *nav = (PinkieNavigationController *)self.fromVC.navigationController;
    self.navigationView = nav.navigationView;
    
    CGRect rect = self.navigationView.frame;
    rect.origin.x = -self.screenWidth;
    rect.origin.y = 0;
    self.navigationView.frame = rect;
}

- (void)naviationViewAnimate
{
    CGRect rect = self.navigationView.frame;
    rect.origin.x = 0;
    self.navigationView.frame = rect;
}

- (void)navigationViewAnimateComplete:(BOOL)cancel
{
    CGRect rect = self.navigationView.frame;
    if (cancel) {
        rect.origin.x = -self.screenWidth;
        self.navigationView.frame = rect;
    } else {
        [self.navigationView removeNavigationItem:self.fromPinkieVC.pinkieItem];
    }
}


@end
