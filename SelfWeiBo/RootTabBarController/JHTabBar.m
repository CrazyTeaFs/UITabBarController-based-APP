//
//  JHTabBar.m
//  SelfWeiBo
//
//  Created by gameloft on 16/6/9.
//  Copyright © 2016年 gameloft. All rights reserved.
//

#import "JHTabBar.h"

@interface JHTabBar()

//** plus button */
@property (nonatomic, weak) UIButton *plusButton;

@end

@implementation JHTabBar

/**
 *  重写初始化函数，添加中间的button
 *
 *  @param frame frame
 *
 *  @return return instance of JHTabBar
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        self.plusButton = plusBtn;
        [self addSubview:plusBtn];
    }
    
    return self;
}

/**
 *  布局子视图，这个函数会被调用来布局视图
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置plusButton的frame(宽高为加载的图片的宽高)和center(就是底部工具栏的中心)
    self.plusButton.frame = CGRectMake(0, 0, self.plusButton.currentImage.size.width, self.plusButton.currentImage.size.height);
    self.plusButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    
    //布局5个button
    //5个button要布满整个底部工具栏，那么button宽度就是底部工具栏宽度的1/5，而x是以1/5工具栏宽度为增量递增
    NSInteger index = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.frame.size.width * 0.2;
    CGFloat height = self.frame.size.height;
    
    //遍历TabBar的子视图，取出UITabBarButton，设置frame以达到跳过中间的自定义button来布局的目的
    Class class = NSClassFromString(@"UITabBarButton");
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:class]) {
            
            x = width * (index == 2 ? ++index : index);
            view.frame = CGRectMake(x, y, width, height);
            ++index;
        }
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
