//
//  PinkieNavigationDelegateImp.h
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>
#import "PinkiePopInteractiveTransitioning.h"

NS_ASSUME_NONNULL_BEGIN

@interface PinkieNavigationDelegateImp : NSObject <UINavigationControllerDelegate>

@property (nonatomic, strong) PinkiePopInteractiveTransitioning  *transitioning;
@property (nonatomic, assign) BOOL  push;

@end

NS_ASSUME_NONNULL_END
