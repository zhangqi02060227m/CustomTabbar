//
//  UIImage+Extension.h
//  CaiJinSuo2.0
//
//  Created by 张琦 on 16/6/29.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
// 图片增加圆角
- (UIImage *)imageWithCornerRadius:(CGFloat)radius;
+ (UIImage*)createImageWithColor:(UIColor*)color   size:(CGSize)size;
@end
