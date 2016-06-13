//
//  UIBarButtonItem+JHExension.h
//  WeiBo
//
//  Created by gameloft on 16/5/19.
//  Copyright © 2016年 gameloft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JHExension)

+ (instancetype)itemWithImageName:(NSString *)imageName highLightImageName:(NSString *)highLightImageName target:(id)target action:(SEL)action;

@end
