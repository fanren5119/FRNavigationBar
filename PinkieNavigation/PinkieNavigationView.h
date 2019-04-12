//
//  PinkieNavigationView.h
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PinkieNavigationItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface PinkieNavigationView : UIView

- (void)addNavigationItem:(PinkieNavigationItem *)item;

- (void)removeNavigationItem:(PinkieNavigationItem *)item;

- (void)removeAllItems;

- (void)refreshNavigationItem:(PinkieNavigationItem *)item;

@end

NS_ASSUME_NONNULL_END
