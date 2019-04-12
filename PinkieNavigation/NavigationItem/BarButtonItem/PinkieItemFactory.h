//
//  PinkieItemFactory.h
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PinkieBarButtonItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface PinkieItemFactory : NSObject

+ (id<PinkieBarButtonItem>)barButtonItem:(BarItemType)type title:(NSString *)title block:(BarItemBlock)block;

+ (id<PinkieBarButtonItem>)barButtonItem:(BarItemType)type image:(NSString *)image block:(BarItemBlock)block;

+ (id<PinkieBarButtonItem>)barButtonItem:(BarItemType)type image:(NSString *)image title:(NSString *)title block:(BarItemBlock)block;

@end

NS_ASSUME_NONNULL_END
