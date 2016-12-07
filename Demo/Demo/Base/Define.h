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


#define HOTFILE_URL @"http://api.maoyan.com/mmdb/movie/v3/list/hot.json?uuid=270BA3C42F95526870390EAD7C3D3A8FAD15336C8590C829D4D35BA9F36E0EB8&utm_source=AppStore&utm_term=7.5&utm_content=270BA3C42F95526870390EAD7C3D3A8FAD15336C8590C829D4D35BA9F36E0EB8&version_name=7.5&userid=713317510&utm_medium=iphone&movieBundleVersion=100&utm_campaign=AmovieBmovieD300H0&__reqTraceID=0D651BA2-1706-4F9B-8978-5DBE5E95F7BE&limit=12&ci=10&client=iphone&msid=6A91AF37-FDAB-46C7-B36C-8F96738805922016-12-05-13-36962"

#define FILMCOMMENT_URL @"http://api.maoyan.com/mmdb/comments/pro/movie/344881.json?offset=0&limit=4&utm_campaign=AmovieBmovieC110189035496448D-1&movieBundleVersion=7601&utm_source=meizu&utm_medium=android&utm_term=7.6.0&utm_content=867246027510362&ci=10&net=255&dModel=MX5&uuid=6F60EEBBA39DAE0333BC251DC6C24E3D2834BC1A9F0583153E8EF02233E14766&refer=/CinemaOfMovieActivity"


#endif /* Define_h */












