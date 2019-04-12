//
//  PinkieNavigationItem.h
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PinkieBarButtonItem.h"

@interface PinkieNavigationItem : NSObject

@property (nonatomic, assign) BOOL                      navigationHidden;
@property (nonatomic, strong) NSString                  *title;
@property (nonatomic, strong) NSAttributedString        *attributeString;
@property (nonatomic, strong) UIView                    *titleView;
@property (nonatomic, strong) id<PinkieBarButtonItem>   leftBarButtonItem;
@property (nonatomic, strong) id<PinkieBarButtonItem>   rightBarButtonItem;
@property (nonatomic, strong) UIColor                   *tintColor;
@property (nonatomic, strong) UIColor                   *backgroundColor;

@end
