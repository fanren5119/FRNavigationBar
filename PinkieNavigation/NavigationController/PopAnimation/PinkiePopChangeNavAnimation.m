//
//  PinkiePopChangeNavAnimation.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkiePopChangeNavAnimation.h"
#import "PinkieNavigationView.h"
#import "PinkieNavigationController.h"

@interface PinkiePopChangeNavAnimation ()

@property (nonatomic, strong) PinkieNavigationView  *navigationView;

@end

@implementation PinkiePopChangeNavAnimation

- (void)navigationViewPerpare
{
    PinkieNavigationController *nav = (PinkieNavigationController *)self.fromVC.navigationController;
    self.navigationView = nav.navigationView;
    self.navigationView.backgroundColor = self.fromPinkieVC.pinkieItem.backgroundColor;
    
    CGPoint toTitleCenter = self.toPinkieVC.pinkieItem.titleView.center;
    toTitleCenter.x = self.screenWidth / 2;
    self.toPinkieVC.pinkieItem.titleView.center = toTitleCenter;
    self.toPinkieVC.pinkieItem.titleView.alpha = 0;
    [self.toPinkieVC.pinkieItem.leftBarButtonItem getBarButtonView].alpha = 0;
    [self.toPinkieVC.pinkieItem.rightBarButtonItem getBarButtonView].alpha = 0;
    
    CGPoint fromTitleCenter = self.fromPinkieVC.pinkieItem.titleView.center;
    fromTitleCenter.x =  self.screenWidth / 2;
    self.fromPinkieVC.pinkieItem.titleView.center = fromTitleCenter;
    self.fromPinkieVC.pinkieItem.titleView.alpha = 1;
    [self.fromPinkieVC.pinkieItem.leftBarButtonItem getBarButtonView].alpha = 1;
    [self.fromPinkieVC.pinkieItem.rightBarButtonItem getBarButtonView].alpha = 1;
}

- (void)naviationViewAnimate
{
    self.toPinkieVC.pinkieItem.titleView.alpha = 1;
    [self.toPinkieVC.pinkieItem.leftBarButtonItem getBarButtonView].alpha = 1;
    [self.toPinkieVC.pinkieItem.rightBarButtonItem getBarButtonView].alpha = 1;
    
    CGPoint fromTitleCenter = self.fromPinkieVC.pinkieItem.titleView.center;
    fromTitleCenter.x =  self.screenWidth - 30;
    self.fromPinkieVC.pinkieItem.titleView.center = fromTitleCenter;
    self.fromPinkieVC.pinkieItem.titleView.alpha = 0;
    [self.fromPinkieVC.pinkieItem.leftBarButtonItem getBarButtonView].alpha = 0;
    [self.fromPinkieVC.pinkieItem.rightBarButtonItem getBarButtonView].alpha = 0;
    
    self.navigationView.backgroundColor = self.toPinkieVC.pinkieItem.backgroundColor;
}

- (void)navigationViewAnimateComplete:(BOOL)cancel
{
    if (cancel) {
        self.fromPinkieVC.pinkieItem.titleView.alpha = 1;
        [self.fromPinkieVC.pinkieItem.leftBarButtonItem getBarButtonView].alpha = 1;
        [self.fromPinkieVC.pinkieItem.rightBarButtonItem getBarButtonView].alpha = 1;
        [self.navigationView removeNavigationItem:self.toPinkieVC.pinkieItem];
        self.navigationView.backgroundColor = self.fromPinkieVC.pinkieItem.backgroundColor;
    } else {
        [self.navigationView removeNavigationItem:self.fromPinkieVC.pinkieItem];
        self.navigationView.backgroundColor = self.toPinkieVC.pinkieItem.backgroundColor;
    }
}

@end
