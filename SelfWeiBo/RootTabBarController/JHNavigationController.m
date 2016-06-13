//
//  JHNavigationController.m
//  SelfWeiBo
//
//  Created by gameloft on 16/6/13.
//  Copyright © 2016年 gameloft. All rights reserved.
//

#import "JHNavigationController.h"

@interface JHNavigationController ()

@end

@implementation JHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    /**
     这里要特别注意，在系统为我们启动应用时，这个pushViewController会被调用，我们不希望程序一启动连最开始的ViewController也有backbutton，所以这个if很重要。
     为了自定义push过后的返回按钮，需要拦截pushViewController这个方法来设置。
     *  当系统第一次帮我们push的时候，4个view的childViewController.count为0，不会进到if中，所以不管是bottomBar还是leftBarButtonItem都是view自己的设置。如果点击view左上方按钮push页面，此时view的childViewController.count大于0，那么就会进入if设置leftBarButtonItem和bottomBar了
     */
    if (self.childViewControllers.count > 0) {
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //设置返回按钮的title，默认title颜色和点击后title的颜色
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        //设置返回按钮上的 < 箭头
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        
        backButton.size = CGSizeMake(100, 40);
        
        //设置返回按钮中内容(button中默认存在的左边的image和右边的label)为居中显示，以调整返回按钮中内容距左边界的距离
        backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //只靠设置内容居中还不够，我们需要再往左靠，这个时候需要设置内边距
        [backButton setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        
        //设置button响应函数
        [backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        
        //push完成后如果需要隐藏底部工具栏请放开下面这句代码
        //viewController.hidesBottomBarWhenPushed = YES;
        
        //用backButton来填充UIBarButtonItem
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
    
    //!!!!!千万不能忘记调用父类的pushViewController方法，否则就不能正常push了
    [super pushViewController:viewController animated:animated];
}

- (void)back:(UIButton *)btn
{
    [self popViewControllerAnimated:YES];
}


@end
