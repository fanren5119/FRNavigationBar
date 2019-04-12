//
//  PinkiePopInteractiveTransitioning.h
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PinkiePopInteractiveTransitioning : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL                      isInteracting;
@property (nonatomic, weak) UINavigationController      *navigationController;

@end

NS_ASSUME_NONNULL_END
