//
//  PinkieNavigationView.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieNavigationView.h"

@interface PinkieNavigationView ()

@property (nonatomic, strong) NSMutableArray        *itemArray;
@property (nonatomic, strong) NSMutableDictionary   *itemViewsDict;

@end

@implementation PinkieNavigationView

- (void)addNavigationItem:(PinkieNavigationItem *)item
{
    if ([self.itemArray containsObject:item]) {
        return;
    }
    
    NSMutableArray *viewArray = [NSMutableArray arrayWithCapacity:3];
    
    PinkieBarButtonView *leftItemView = [item.leftBarButtonItem getBarButtonView];
    CGFloat leftWidth = [leftItemView viewWidth];
    leftItemView.frame = CGRectMake(8.0, self.frame.size.height - 44.0, leftWidth, 44.0);
    [self addSubview:leftItemView];
    if (leftItemView) {
        [viewArray addObject:leftItemView];
    }
    
    PinkieBarButtonView *rightItemView = [item.rightBarButtonItem getBarButtonView];
    CGFloat rightWidth = [rightItemView viewWidth];
    rightItemView.frame = CGRectMake(self.frame.size.width - rightWidth - 8.0, self.frame.size.height - 44, rightWidth, 44.0);
    [self addSubview:rightItemView];
    if (rightItemView) {
        [viewArray addObject:rightItemView];
    }
    
    if (item.titleView) {
        item.titleView.center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height - 22.0);
        [self addSubview:item.titleView];
    } else {
        CGFloat width = self.frame.size.width - MAX(leftWidth, rightWidth) * 2.0 - 16.0;
        CGRect rect = CGRectMake(0.0, 0.0, width, 44.0);
        UILabel *label = [[UILabel alloc] initWithFrame:rect];
        label.center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height - 22.0);
        label.textAlignment = NSTextAlignmentCenter;
        label.text = item.title;
        label.font = [UIFont boldSystemFontOfSize:18.0];
        label.textColor = [UIColor whiteColor];
        [self addSubview:label];
        
        item.titleView = label;
    }
    
    if (item.titleView) {
        [viewArray addObject:item.titleView];
    }
    [self.itemArray addObject:item];
    [self.itemViewsDict setObject:viewArray forKey:item.description];
}

- (void)removeNavigationItem:(PinkieNavigationItem *)item
{
    if ([self.itemArray containsObject:item]) {
        
        NSArray *itemViews = [self.itemViewsDict objectForKey:item.description];
        for (UIView *view in itemViews) {
            [view removeFromSuperview];
        }
        [self.itemViewsDict removeObjectForKey:item.description];
        [self.itemArray removeObject:item];
    }
}

- (void)removeAllItems
{
    for (PinkieNavigationItem *item in self.itemArray) {
        NSArray *itemViews = [self.itemViewsDict objectForKey:item.description];
        for (UIView *view in itemViews) {
            [view removeFromSuperview];
        }
    }
    [self.itemViewsDict removeAllObjects];
    [self.itemArray removeAllObjects];
}

- (void)refreshNavigationItem:(PinkieNavigationItem *)item
{
    if (![self.itemArray containsObject:item]) {
        return;
    }
    [self removeNavigationItem:item];
    [self addNavigationItem:item];
}

- (NSMutableArray *)itemArray
{
    if (_itemArray == nil) {
        _itemArray = [NSMutableArray arrayWithCapacity:2];
    }
    return _itemArray;
}

- (NSMutableDictionary *)itemViewsDict
{
    if (_itemViewsDict == nil) {
        _itemViewsDict = [NSMutableDictionary dictionaryWithCapacity:2];
    }
    return _itemViewsDict;
}

@end
