//
//  PinkieImageBarButtonItem.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieImageBarButtonItem.h"
#import "PinkieImageBarButtonView.h"

@interface PinkieImageBarButtonItem ()

@property (nonatomic, strong) PinkieImageBarButtonView  *barButtonView;
@property (nonatomic, strong) NSString                  *imageName;

@end

@implementation PinkieImageBarButtonItem

@synthesize barItemType = _barItemType;
@synthesize tintColor = _tintColor;
@synthesize enable = _enable;
@synthesize block = _block;

- (instancetype)initWithImageName:(NSString *)imageName block:(void (^) (void))block
{
    if (self = [super init]) {
        self.imageName = imageName;
        self.block = block;
        self.enable = YES;
    }
    return self;
}

- (BarItemType)barItemType
{
    return itemType_image;
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
        self.barButtonView = [[PinkieImageBarButtonView alloc] initWithImageName:self.imageName block:self.block];
    }
    self.barButtonView.tintColor = self.tintColor;
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
