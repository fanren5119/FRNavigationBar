//
//  PinkieTitleBarButtonView.h
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinkieBarButtonView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PinkieTitleBarButtonView : PinkieBarButtonView

- (instancetype)initWithTitle:(NSString *)title block:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END
