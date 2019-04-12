//
//  PinkieBarButtonView.h
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PinkieBarButtonView : UIView

- (CGFloat)viewWidth;

- (void)setEnable:(BOOL)enable;

- (void)resetWithImage:(UIImage *)image title:(NSString *)title;

- (void)resetWithImage:(UIImage *)image;

- (void)resetWithTile:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
