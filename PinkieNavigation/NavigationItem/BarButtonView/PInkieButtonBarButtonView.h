//
//  PInkieButtonBarButtonView.h
//  PinkieBaseViewKit
//
//  Created by jiazhiyi on 2019/4/11.
//  Copyright © 2019 JackJiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinkieBarButtonView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PInkieButtonBarButtonView : PinkieBarButtonView

- (instancetype)initWithTitle:(NSString *)title block:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END
