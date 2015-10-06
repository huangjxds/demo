//
//  TopTabBar.h
//  infiniteScorllView
//
//  Created by wongkarhung on 15/9/26.
//  Copyright (c) 2015年 wong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WKHTabBar;

@protocol WKHTabBarDelegate <NSObject>

@optional

-(void)TabBarButtonDidSelected:(WKHTabBar *)tabBar fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

@end

@interface WKHTabBar : UIView<UIScrollViewDelegate>


@property (nonatomic, assign) id<WKHTabBarDelegate> delegate;

- (id)initWithItems:(NSMutableArray *)items;

@end
