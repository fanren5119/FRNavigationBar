//
//  PinkieNavigationController.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieNavigationController.h"
#import "PinkiePopAnimatedTransitioning.h"
#import "PinkieNavigationDelegateImp.h"

@interface PinkieNavigationController ()

@property (nonatomic, strong) PinkiePopInteractiveTransitioning     *popTransition;
@property (nonatomic, strong) PinkieNavigationDelegateImp           *delegateImp;

@end

@implementation PinkieNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBarHidden = YES;
    [self setupDelegateImp];
    [self setupUI];
}

- (void)setupDelegateImp
{
    self.popTransition = [[PinkiePopInteractiveTransitioning alloc] init];
    self.popTransition.navigationController = self;
    
    self.delegateImp = [[PinkieNavigationDelegateImp alloc] init];
    self.delegateImp.transitioning = self.popTransition;
    self.delegate = self.delegateImp;
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)setupUI
{
    [self setupNavigationView];
}

- (void)setupNavigationView
{
    CGFloat height = 64;
    if ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896) {
        height = 88;
    }
    CGFloat width = self.view.frame.size.width;
    CGRect rect = CGRectMake(0.0, 0.0, width, height);
    self.navigationView = [[PinkieNavigationView alloc] initWithFrame:rect];
    [self.view addSubview:self.navigationView];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
}

- (void)setNavigationViewHide:(BOOL)hide animate:(BOOL)animate
{
    CGRect rect = self.navigationView.frame;
    rect.origin.x = 0;
    self.navigationView.frame = rect;
    
    rect.origin.y = hide ? -rect.size.height : 0;
    if (!animate) {
        self.navigationView.frame = rect;
        return;
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        self.navigationView.frame = rect;
    } completion:nil];
}

@end
