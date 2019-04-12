//
//  PinkieNavigationItem.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieNavigationItem.h"

@implementation PinkieNavigationItem

- (void)setTintColor:(UIColor *)tintColor
{
    _tintColor = tintColor;
}

- (UIColor *)backgroundColor
{
    if (_backgroundColor == nil) {
        return [UIColor redColor];
    }
    return _backgroundColor;
}


@end
