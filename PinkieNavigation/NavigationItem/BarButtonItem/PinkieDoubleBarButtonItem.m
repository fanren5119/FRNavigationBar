//
//  PinkieDoubleBarButtonItem.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieDoubleBarButtonItem.h"
#import "PinkieDoubleBarButtonView.h"

@interface PinkieDoubleBarButtonItem ()

@property (nonatomic, strong) NSString                      *imageName;
@property (nonatomic, strong) NSString                      *title;
@property (nonatomic, strong) PinkieDoubleBarButtonView     *barButtonView;

@end

@implementation PinkieDoubleBarButtonItem
@synthesize barItemType = _barItemType;
@synthesize tintColor = _tintColor;
@synthesize enable = _enable;
@synthesize block = _block;

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title block:(void (^) (void))block
{
    if (self = [super init]) {
        self.imageName = imageName;
        self.title = title;
        self.enable = YES;
        self.block = block;
    }
    return self;
}

- (BarItemType)barItemType
{
    return itemType_double;
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
        self.barButtonView = [[PinkieDoubleBarButtonView alloc] initWithImageName:self.imageName title:self.title block:self.block];
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
