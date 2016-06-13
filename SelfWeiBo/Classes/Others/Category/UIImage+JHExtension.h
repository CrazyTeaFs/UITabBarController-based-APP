//
//  UIImage+JHExtension.h
//  SelfWeiBo
//
//  Created by gameloft on 16/6/12.
//  Copyright © 2016年 gameloft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JHExtension)

- (UIImage *)jh_originalImage;
+ (UIImage *)jh_OriginalImageWithName:(NSString *)imageName;

@end
