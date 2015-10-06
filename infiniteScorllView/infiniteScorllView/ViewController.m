//
//  ViewController.m
//  infiniteScorllView
//
//  Created by wongkarhung on 15/9/26.
//  Copyright (c) 2015年 wong. All rights reserved.
//

#import "ViewController.h"
#import "WKHTabBar.h"

#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]

@interface ViewController ()

@property (nonatomic, strong) UIView *contanierView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *_items = [NSMutableArray arrayWithObjects:@"太阳城", @"资讯动态", @"会员部", @"系统设定", @"在线客服", @"最新动态",  nil];
    WKHTabBar *tabBar = [[WKHTabBar alloc] initWithItems:_items];
    tabBar.delegate = self;
    [self.view addSubview:tabBar];
    
    _contanierView = [[UIView alloc] init];
    _contanierView.frame = CGRectMake(0, 50, ScreenWidth, ScreenHeight - tabBar.frame.origin.y);
    _contanierView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_contanierView];
    
    UIViewController *controller1 = [[UIViewController alloc] init];
    controller1.view.backgroundColor = RandomColor;
    
    UILabel *labe1 = [[UILabel alloc] init];
    labe1.text = @"太阳城";
    labe1.textColor = [UIColor blackColor];
    [labe1 setFont:[UIFont boldSystemFontOfSize:20]];
    labe1.frame = CGRectMake(0, 0, 150, 30);
    [controller1.view addSubview:labe1];
    
    [self addChildViewController:controller1];
    
    UIViewController *controller2 = [[UIViewController alloc] init];
    controller2.view.backgroundColor = RandomColor;
    
    UILabel *labe2 = [[UILabel alloc] init];
    labe2.text = @"资讯动态";
    labe2.textColor = [UIColor blackColor];
    [labe2 setFont:[UIFont boldSystemFontOfSize:20]];
    labe2.frame = CGRectMake(0, 0, 150, 30);
    [controller2.view addSubview:labe2];
    
    [self addChildViewController:controller2];
    
    UIViewController *controller3 = [[UIViewController alloc] init];
    controller3.view.backgroundColor = RandomColor;
    
    UILabel *labe3 = [[UILabel alloc] init];
    labe3.text = @"会员部";
    labe3.textColor = [UIColor blackColor];
    [labe3 setFont:[UIFont boldSystemFontOfSize:20]];
    labe3.frame = CGRectMake(0, 0, 150, 30);
    [controller3.view addSubview:labe3];

    [self addChildViewController:controller3];
    
    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = RandomColor;
    
    UILabel *labe4 = [[UILabel alloc] init];
    labe4.text = @"系统设定";
    labe4.textColor = [UIColor blackColor];
    [labe4 setFont:[UIFont boldSystemFontOfSize:20]];
    labe4.frame = CGRectMake(0, 0, 150, 30);
    [controller4.view addSubview:labe4];

    
    [self addChildViewController:controller4];
    
    UIViewController *controller5 = [[UIViewController alloc] init];
    controller5.view.backgroundColor = RandomColor;
    
    UILabel *labe5 = [[UILabel alloc] init];
    labe5.text = @"在线客服";
    labe5.textColor = [UIColor blackColor];
    [labe5 setFont:[UIFont boldSystemFontOfSize:20]];
    labe5.frame = CGRectMake(0, 0, 150, 30);
    [controller5.view addSubview:labe5];

    
    [self addChildViewController:controller5];
    
    UIViewController *controller6 = [[UIViewController alloc] init];
    controller6.view.backgroundColor = RandomColor;
    UILabel *labe6 = [[UILabel alloc] init];
    labe6.text = @"最新动态";
    labe6.textColor = [UIColor blackColor];
    [labe6 setFont:[UIFont boldSystemFontOfSize:20]];
    labe6.frame = CGRectMake(0, 0, 150, 30);
    [controller6.view addSubview:labe6];
    
    [self addChildViewController:controller6];

    
    
}

- (void)TabBarButtonDidSelected:(WKHTabBar *)tabBar fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex
{
//    if (fromIndex == toIndex) {
//        return;
//    }
    UIViewController *fromContrl = self.childViewControllers[fromIndex];
    UIView *fromView = fromContrl.view;
    UIViewController *toContrl = self.childViewControllers[toIndex];
    UIView *toView = toContrl.view;

        
        [fromView removeFromSuperview];
        [self.contanierView addSubview:toView];

 
    
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
