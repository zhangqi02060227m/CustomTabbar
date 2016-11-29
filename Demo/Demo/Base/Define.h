//
//  Define.h
//  XiangMuLianXI
//
//  Created by 张琦 on 16/5/25.
//  Copyright © 2016年 张琦. All rights reserved.
//

#ifndef Define_h
#define Define_h

/**
 *  这个类是一些常用的宏定义
 */

static float DEFAULT_CELL_HEIGHT = 50;
static float TOP_CELL_HEIGHT = 50;
static float HEADER_CELL_HEIGHT = 10;
static float FOOTER_CELL_HEIGHT = 0.00001;

// 16进制颜色转换
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define RGBAColor(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RandColor RGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#define SystenVersion [UIDevice currentDevice].systemVersion.floatValue // 系统的版本
#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))




// 屏幕的高度和宽度
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height



#define PathTop [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"topData.plist"]







#endif /* Define_h */












