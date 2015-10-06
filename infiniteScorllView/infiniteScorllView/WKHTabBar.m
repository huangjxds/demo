//
//  TopTabBar.m
//  infiniteScorllView
//
//  Created by wongkarhung on 15/9/26.
//  Copyright (c) 2015年 wong. All rights reserved.
//

#import "WKHTabBar.h"
//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define NUM(_i) (100 + _i)

#define ButtonWidth 80

#define ButtonHeight 30

@interface WKHTabBar()

@property (nonatomic, assign) NSUInteger selectedIndex;

@property (nonatomic, strong) UIScrollView *topScrollView;

@property (nonatomic, strong) NSMutableArray *btns;

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) NSInteger itemsCount;

@end

@implementation WKHTabBar

- (id) initWithItems:(NSMutableArray *)items
{
    self = [super init];
    if (self) {
        _btns = [NSMutableArray array];
        _items = items;
        _itemsCount = items.count;
        
        _topScrollView = [[UIScrollView alloc] init];
        _topScrollView.backgroundColor = [UIColor grayColor];
        _topScrollView.showsHorizontalScrollIndicator = NO;
        _topScrollView.bounces = NO;
        _topScrollView.delegate = self;
        _topScrollView.frame = CGRectMake(0, 0, ScreenWidth , ButtonHeight);
        for (int i = 0; i < _itemsCount * 3; i++) {
            NSInteger index = i % _itemsCount;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i * ButtonWidth, 0, ButtonWidth, ButtonHeight);
            [button setTitle:_items[index] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
            [button setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
            button.backgroundColor = [UIColor clearColor];
            button.tag = i;
            [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_topScrollView addSubview:button];
            
            [_btns addObject:button];

        }
        [self addSubview:_topScrollView];
    
    }
    
    return self;

}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.frame = CGRectMake(0, 20, ScreenWidth, 30);
    _topScrollView.contentSize = CGSizeMake(ButtonWidth * _items.count * 3, ButtonHeight);

    UIButton *defaultSelectedBtn = _btns[0 + _itemsCount];
    
    [self btnSelected:defaultSelectedBtn];
    [self setButtonToMiddle:defaultSelectedBtn animated:NO];
    
}



- (void)btnClick:(UIButton *)button
{
    [self btnSelected:button];
    [self setButtonToMiddle:button animated:YES];
}

//选中按钮状态切换同通知代理
- (void)btnSelected:(UIButton *)button
{
    NSInteger fromIndex =  _selectedIndex ;
    NSInteger toIndex = button.tag % _itemsCount;
    _selectedIndex = toIndex;
    
    for (NSInteger i = 0; i < 3; i++) {
        UIButton *fromButton =  _btns[fromIndex + i * _itemsCount];
        fromButton.selected = NO;
        UIButton *toButton = _btns[toIndex + i * _itemsCount];
        toButton.selected = YES;
    }
 
    NSLog(@"fromIndex %ld --- toIndex %ld", fromIndex, toIndex);
    
    if ([self.delegate respondsToSelector:@selector(TabBarButtonDidSelected:fromIndex:toIndex:)]) {
        [self.delegate TabBarButtonDidSelected:self fromIndex:fromIndex toIndex:toIndex];
    }


}

//选中的按钮置中
- (void)setButtonToMiddle:(UIButton*)selectedButton animated:(BOOL)animated
{
    CGFloat centerX = _topScrollView.contentOffset.x + ScreenWidth / 2 - ButtonWidth/2;
    CGFloat offsetX = selectedButton.frame.origin.x - centerX;
    CGPoint toPoint = CGPointMake(_topScrollView.contentOffset.x + offsetX, 0);
    [_topScrollView setContentOffset:toPoint animated: animated];
    NSLog(@"test");
    
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
   // NSLog(@"%f", offsetX);
    if (offsetX <= 0) {
        [scrollView setContentOffset:CGPointMake(_itemsCount * ButtonWidth, 0) animated:NO];
    } else if (offsetX >= _itemsCount * 3 * ButtonWidth - ScreenWidth) {
        
        [scrollView setContentOffset:CGPointMake(_itemsCount * 2 *ButtonWidth - ScreenWidth, 0) animated:NO];
    }
    
}





@end
