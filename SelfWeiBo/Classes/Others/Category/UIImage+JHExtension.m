//
//  UIImage+JHExtension.m
//  SelfWeiBo
//
//  Created by gameloft on 16/6/12.
//  Copyright © 2016年 gameloft. All rights reserved.
//

#import "UIImage+JHExtension.h"

@implementation UIImage (JHExtension)

- (UIImage *)jh_originalImage
{
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)jh_OriginalImageWithName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return image;
}

@end
