//
//  PinkieTitleBarButtonItem.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieTitleBarButtonItem.h"
#import "PinkieTitleBarButtonView.h"

@interface PinkieTitleBarButtonItem ()

@property (nonatomic, strong) NSString                  *title;
@property (nonatomic, strong) PinkieTitleBarButtonView  *barButtonView;

@end

@implementation PinkieTitleBarButtonItem

@synthesize barItemType = _barItemType;
@synthesize tintColor = _tintColor;
@synthesize enable = _enable;
@synthesize block = _block;

- (instancetype)initWithTitle:(NSString *)title block:(void(^)(void))block
{
    if (self = [super init]) {
        self.title = title;
        self.block = block;
        self.enable = YES;
    }
    return self;
}

- (BarItemType)barItemType
{
    return itemType_title;
}

- (void)setTintColor:(UIColor *)tintColor
{
    _tintColor = tintColor;
    self.barButtonView.tintColor = tintColor;
}

- (void)setEnable:(BOOL)enable
{
    _enable = enable;
    [self.barButtonView setEnable:enable];
}

- (PinkieBarButtonView *)getBarButtonView
{
    if (self.barButtonView == nil) {
        self.barButtonView = [[PinkieTitleBarButtonView alloc] initWithTitle:self.title block:self.block];
    }
    if (self.tintColor) {
        self.barButtonView.tintColor = self.tintColor;
    }
    [self.barButtonView setEnable:self.enable];
    return self.barButtonView;
}

- (void)resetWithImage:(UIImage *)image title:(NSString *)title
{
    [self.barButtonView resetWithImage:image title:title];
}

- (void)resetWithImage:(UIImage *)image
{
    [self.barButtonView resetWithImage:image];
}

- (void)resetWithTile:(NSString *)title
{
    [self.barButtonView resetWithTile:title];
}


@end
