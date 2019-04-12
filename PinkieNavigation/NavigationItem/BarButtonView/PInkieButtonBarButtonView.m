//
//  PInkieButtonBarButtonView.m
//  PinkieBaseViewKit
//
//  Created by jiazhiyi on 2019/4/11.
//  Copyright © 2019 JackJiang. All rights reserved.
//

#import "PInkieButtonBarButtonView.h"

@interface PInkieButtonBarButtonView ()

@property (nonatomic, strong) NSString      *title;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UIButton      *button;
@property (nonatomic, strong) void (^block) (void);
@property (nonatomic, assign) CGFloat       width;
@property (nonatomic, assign) BOOL          clickEnable;

@end

@implementation PInkieButtonBarButtonView

- (instancetype)initWithTitle:(NSString *)title block:(void(^)(void))block
{
    self = [super init];
    if (self) {
        self.title = title;
        self.block = block;
        self.clickEnable = YES;
        
        [self calculateWidth];
        [self createUI];
    }
    return self;
}

- (void)calculateWidth
{
    CGSize size = CGSizeMake(150.0, CGFLOAT_MAX);
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:12.0]};
    CGRect rect = [self.title boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesDeviceMetrics attributes:attribute context:nil];
    self.width = MAX(rect.size.width + 7.0 * 2, 54) + 4.0 * 2;
}

- (void)createUI
{
    [self createTitleLabel];
    [self createButton];
}

- (void)createTitleLabel
{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont systemFontOfSize:12.0];
    self.titleLabel.text = self.title;
    self.titleLabel.layer.cornerRadius = 4;
    self.titleLabel.layer.masksToBounds = YES;
    self.titleLabel.backgroundColor = [UIColor colorWithRed:45 / 255.0 green:145 / 255.0 blue:239 / 255.0 alpha:1];
    [self addSubview:self.titleLabel];
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
    
    CGRect rect = self.titleLabel.frame;
    rect.size = CGSizeMake(self.frame.size.width - 8, 27.0);
    rect.origin.x = 4;
    rect.origin.y = (self.frame.size.height - 27.0) / 2.0;
    self.titleLabel.frame = rect;
    
    self.button.frame = self.bounds;
}


- (CGFloat)viewWidth
{
    return self.width;
}

- (void)setEnable:(BOOL)enable
{
    self.clickEnable = enable;
    if (enable) {
        self.titleLabel.backgroundColor = [UIColor colorWithRed:45 / 255.0 green:145 / 255.0 blue:239 / 255.0 alpha:1];
        self.titleLabel.textColor = [UIColor whiteColor];
//        self.titleLabel.alpha = 1;
    } else {
//        self.titleLabel.alpha = 0.4;
        self.titleLabel.backgroundColor = [UIColor colorWithRed:45 / 255.0 green:145 / 255.0 blue:239 / 255.0 alpha:0.4];
        self.titleLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.4];
    }
}

- (void)setTintColor:(UIColor *)tintColor
{
    self.titleLabel.textColor = tintColor;
}

- (void)resetWithImage:(UIImage *)image title:(NSString *)title
{
    [self resetWithTile:title];
}

- (void)resetWithImage:(UIImage *)image
{
    
}

- (void)resetWithTile:(NSString *)title
{
    self.title = title;
    [self calculateWidth];
    self.titleLabel.text = title;
}

@end
