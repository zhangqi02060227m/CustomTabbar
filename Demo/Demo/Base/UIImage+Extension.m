//
//  UIImage+Extension.m
//  CaiJinSuo2.0
//
//  Created by 张琦 on 16/6/29.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "UIImage+Extension.h"
#import <UIKit/UIKit.h>
@implementation UIImage (Extension)

- (UIImage *)imageWithCornerRadius:(CGFloat)radius {
//    CGRect rect = (CGRect){0.f, 0.f, self.size};
//    
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, UIScreen.mainScreen.scale);
//    CGContextAddPath(UIGraphicsGetCurrentContext(),
//                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
//    CGContextClip(UIGraphicsGetCurrentContext());
//    
//    [self drawInRect:rect];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return image;
    
    CGFloat w = self.size.width;
    CGFloat h = self.size.height;
    CGFloat scale = [UIScreen mainScreen].scale;
    if (radius < 0) {
        radius = 0;
    } else if (radius > MIN(w, h)) {
        radius = MIN(w, h) / 2;
    }
    UIImage *image = nil;
    CGRect imageFrame = CGRectMake(0, 0, w, h);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, scale);
    [[UIBezierPath bezierPathWithRoundedRect:imageFrame cornerRadius:radius] addClip];
    [self drawInRect:imageFrame];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage*)createImageWithColor:(UIColor*)color   size:(CGSize)size{
    
    CGRect rect = CGRectMake(0,0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}



@end













