//
//  PinkieImageBarButtonView.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieImageBarButtonView.h"

@interface PinkieImageBarButtonView ()

@property (nonatomic, strong) UIImage       *image;
@property (nonatomic, strong) NSString      *imageName;
@property (nonatomic, strong) UIImageView   *imageView;
@property (nonatomic, strong) UIButton      *button;
@property (nonatomic, strong) void (^block) (void);
@property (nonatomic, assign) BOOL          clickEnable;

@end

@implementation PinkieImageBarButtonView

- (instancetype)initWithImageName:(NSString *)imageName block:(void (^) (void))block
{
    self = [super init];
    if (self) {
        self.imageName = imageName;
        self.image = [UIImage imageNamed:self.imageName];
        self.block = block;
        self.clickEnable = YES;
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    [self createImageView];
    [self createButton];
}

- (void)createImageView
{
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    [self addSubview:self.imageView];
}

- (void)createButton
{
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button addTarget:self action:@selector(respondsToButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.button];
}

- (void)respondsToButton
{
    if (self.clickEnable) {
        self.block();
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize size = self.image.size;
    CGRect rect = self.imageView.frame;
    rect.size = size;
    rect.origin.x = 8;
    rect.origin.y = (self.frame.size.height - size.height) / 2.0;
    self.imageView.frame = rect;
    
    self.button.frame = self.bounds;
}

- (CGFloat)viewWidth
{
    return self.image.size.width + 19.0;
}

- (void)setEnable:(BOOL)enable
{
    self.clickEnable = enable;
}

- (void)resetWithImage:(UIImage *)image title:(NSString *)title
{
    self.image = image;
    self.imageView.image = image;
}

- (void)resetWithImage:(UIImage *)image
{
    [self resetWithImage:image title:@""];
}

- (void)resetWithTile:(NSString *)title
{
    
}


@end
