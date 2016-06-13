//
//  UIBarButtonItem+JHExension.m
//  WeiBo
//
//  Created by gameloft on 16/5/19.
//  Copyright © 2016年 gameloft. All rights reserved.
//

#import "UIBarButtonItem+JHExension.h"

@implementation UIBarButtonItem (JHExension)

+ (instancetype)itemWithImageName:(NSString *)imageName highLightImageName:(NSString *)highLightImageName target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highLightImageName] forState:UIControlStateHighlighted];
    btn.bounds = CGRectMake(0, 0, btn.currentImage.size.width, btn.currentImage.size.height);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
