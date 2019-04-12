//
//  PinkieBarButtonItem.h
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PinkieBarButtonView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BarItemType) {
    itemType_title        = 0,
    itemType_image        = 1,
    itemType_double       = 2,
    itemType_button       = 3
};

typedef void (^BarItemBlock) (void);

@protocol PinkieBarButtonItem <NSObject>

@property (nonatomic, assign) BarItemType   barItemType;
@property (nonatomic, strong) UIColor       *tintColor;
@property (nonatomic, assign) BOOL          enable;
@property (nonatomic, strong) BarItemBlock  block;


- (PinkieBarButtonView *)getBarButtonView;

- (void)resetWithImage:(UIImage *)image title:(NSString *)title;

- (void)resetWithImage:(UIImage *)image;

- (void)resetWithTile:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
