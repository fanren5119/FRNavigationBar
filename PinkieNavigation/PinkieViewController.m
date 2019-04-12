//
//  PinkieViewController.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieViewController.h"
#import "PinkieNavigationController.h"

@interface PinkieViewController ()

@end

@implementation PinkieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == nil) {
        if ([keyPath isEqualToString:@"title"] || [keyPath isEqualToString:@"leftBarButtonItem"] || [keyPath isEqualToString:@"rightBarButtonItem"]) {
            PinkieNavigationController *nav = (PinkieNavigationController *)self.navigationController;
            PinkieNavigationView *navigationView = nav.navigationView;
            [navigationView refreshNavigationItem:self.pinkieItem];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (PinkieNavigationItem *)pinkieItem
{
    if (_pinkieItem == nil) {
        _pinkieItem = [[PinkieNavigationItem alloc] init];

        NSKeyValueObservingOptions option = NSKeyValueObservingOptionNew;
        [_pinkieItem addObserver:self forKeyPath:@"title" options:option context:nil];
        [_pinkieItem addObserver:self forKeyPath:@"leftBarButtonItem" options:option context:nil];
        [_pinkieItem addObserver:self forKeyPath:@"rightBarButtonItem" options:option context:nil];
    }
    return _pinkieItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if (self.pinkieItem.navigationHidden) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
#pragma clang diagnostic pop
    
    PinkieNavigationController *nav = (PinkieNavigationController *)self.navigationController;
    PinkieNavigationView *navigationView = nav.navigationView;
    if (animated) {
        [navigationView addNavigationItem:self.pinkieItem];
        return;
    }
    
    [navigationView removeAllItems];
    [navigationView addNavigationItem:self.pinkieItem];
    navigationView.backgroundColor = self.pinkieItem.backgroundColor;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    if (self.pinkieItem.navigationHidden) {
        CGRect rect = navigationView.frame;
        rect.origin.x = width;
        navigationView.frame = rect;
    } else {
        CGRect rect = navigationView.frame;
        rect.origin.x = 0;
        navigationView.frame = rect;
    }
}

- (void)dealloc
{
    [self.pinkieItem removeObserver:self forKeyPath:@"title"];
    [self.pinkieItem removeObserver:self forKeyPath:@"leftBarButtonItem"];
    [self.pinkieItem removeObserver:self forKeyPath:@"rightBarButtonItem"];
}


@end
