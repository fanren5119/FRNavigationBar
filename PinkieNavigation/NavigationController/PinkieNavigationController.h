//
//  PinkieNavigationController.h
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinkieNavigationView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PinkieNavigationController : UINavigationController

@property (nonatomic, strong) PinkieNavigationView  *navigationView;

- (void)setNavigationViewHide:(BOOL)hide animate:(BOOL)animate;

@end

NS_ASSUME_NONNULL_END
