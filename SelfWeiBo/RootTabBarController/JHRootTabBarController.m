//
//  JHRootTabBarController.m
//  SelfWeiBo
//
//  Created by gameloft on 16/6/7.
//  Copyright © 2016年 gameloft. All rights reserved.
//

#import "JHRootTabBarController.h"
#import "JHFirstViewController.h"
#import "JHSecondViewController.h"
#import "JHThirdViewController.h"
#import "JHFourthViewController.h"
#import "UIImage+JHExtension.h"
#import "JHNavigationController.h"
#import "JHTabBar.h"

@interface JHRootTabBarController ()

@end

@implementation JHRootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViews];
    [self setUpTabBarItemTitleColor];
    //为了加入自定义的button到底部工具栏中，我们需要使用自己的TabBar来替换系统默认的。
    //这里使用KVC是因为系统没有提供设置tabBar的方法，只能用这个方法来设置。
    JHTabBar *tabBar = [[JHTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
}

/**
 *  使用Appearance设置UITabBarItem的风格，这样整个APP中的UITabBarItem都是这个风格
 */
- (void)setUpTabBarItemTitleColor
{
    NSDictionary *dic = @{
                          NSForegroundColorAttributeName: [UIColor darkGrayColor]
                          };
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:dic forState:UIControlStateSelected];
}

/**
 *  设置子控制器的title，图片等，因为4个控制器都会有这样的设置，所以写个函数来调用下，免得写那么多
 *
 *  @param childView         需要加入到TabBarController中的控制器
 *  @param title             需要加入到TabBarController中的控制器的title
 *  @param imageName         需要加入到TabBarController中的控制器的TabBarItem图片
 *  @param selectedImageName 需要加入到TabBarController中的控制器的TabBarItem选中时的图片
 */
- (void)setupChildViewControllers:(UIViewController *)childView WithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //设置tabbar的title和view的title
    childView.title = title;
    //设置tabbaritem的默认图片，用UIImage的imageNamed方法传入图片名创建图片
    childView.tabBarItem.image = [UIImage imageNamed:imageName];
    //设置TabBarItem点击后的图片
    childView.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName].jh_originalImage;
    //设置view的背景颜色，这样好看些
    childView.view.backgroundColor = [UIColor purpleColor];
    
    //为了让子控制器有顶部导航栏，我们用JHNavigationController来包装我们的childView
    JHNavigationController *navi = [[JHNavigationController alloc] initWithRootViewController:childView];
    //把导航控制器添加到TabBarController的子控制器中
    [self addChildViewController:navi];
}

/**
 *  创建4个ViewController并添加到UITabBarController中，这里用到的图片后面会提供
 */
- (void)addChildViews
{
    [self setupChildViewControllers:[[JHFirstViewController alloc] init] WithTitle:@"霸" imageName:@"tabBar_essence_icon" selectedImageName:@"tabBar_essence_click_icon"];
    [self setupChildViewControllers:[[JHSecondViewController alloc] init] WithTitle:@"气" imageName:@"tabBar_new_icon" selectedImageName:@"tabBar_new_click_icon"];
    [self setupChildViewControllers:[[JHThirdViewController alloc] init] WithTitle:@"威" imageName:@"tabBar_friendTrends_icon" selectedImageName:@"tabBar_friendTrends_click_icon"];
    [self setupChildViewControllers:[[JHFourthViewController alloc] init] WithTitle:@"武" imageName:@"tabBar_me_icon" selectedImageName:@"tabBar_me_click_icon"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
