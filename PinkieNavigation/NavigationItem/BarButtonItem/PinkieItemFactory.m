//
//  PinkieItemFactory.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieItemFactory.h"
#import "PinkieImageBarButtonItem.h"
#import "PinkieTitleBarButtonItem.h"
#import "PinkieDoubleBarButtonItem.h"
#import "PinkieButtonBarButtonItem.h"

@implementation PinkieItemFactory

+ (id<PinkieBarButtonItem>)barButtonItem:(BarItemType)type title:(NSString *)title block:(BarItemBlock)block
{
    return [self barButtonItem:type image:@"" title:title block:block];
}

+ (id<PinkieBarButtonItem>)barButtonItem:(BarItemType)type image:(NSString *)image block:(BarItemBlock)block
{
    return [self barButtonItem:type image:image title:@"" block:block];
}

+ (id<PinkieBarButtonItem>)barButtonItem:(BarItemType)type image:(NSString *)image title:(NSString *)title block:(BarItemBlock)block
{
    switch (type) {
        case itemType_title:
        {
            return [[PinkieTitleBarButtonItem alloc] initWithTitle:title block:block];
        }
            break;
        case itemType_image:
        {
            return [[PinkieImageBarButtonItem alloc] initWithImageName:image block:block];
        }
            break;
        case itemType_double:
        {
            return [[PinkieDoubleBarButtonItem alloc] initWithImageName:image title:title block:block];
        }
            break;
        case itemType_button:
        {
            return [[PinkieButtonBarButtonItem alloc] initWithTitle:title block:block];
        }
            break;
        default:
            break;
    }
    return nil;
}

@end
