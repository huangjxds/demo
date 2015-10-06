//
//  ViewController.h
//  infiniteScorllView
//
//  Created by wongkarhung on 15/9/26.
//  Copyright (c) 2015年 wong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKHTabBar.h"
//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController : UIViewController<UIScrollViewDelegate, WKHTabBarDelegate>


@end

