//
//  PinkieTitleBarButtonView.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieTitleBarButtonView.h"

@interface PinkieTitleBarButtonView ()

@property (nonatomic, strong) NSString      *title;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UIButton      *button;
@property (nonatomic, strong) void (^block) (void);
@property (nonatomic, assign) CGFloat       width;
@property (nonatomic, assign) BOOL          clickEnable;

@end

@implementation PinkieTitleBarButtonView

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
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:16.0]};
    CGRect rect = [self.title boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    self.width = rect.size.width + 8.0 + 8.0;
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
    self.titleLabel.font = [UIFont systemFontOfSize:16.0];
    self.titleLabel.text = self.title;
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
    rect.size = CGSizeMake(self.frame.size.width - 8, 24.0);
    rect.origin.x = 8;
    rect.origin.y = (self.frame.size.height - 24.0) / 2.0;
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
