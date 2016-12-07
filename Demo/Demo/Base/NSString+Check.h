//
//  NSString+Check.h
//  XiangMuLianXI
//
//  Created by 张琦 on 16/5/26.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Check)
/**
 *  判断手机号是否合法
 *
 *  @param telNumber 手机号
 *
 *  @return 匹配结果，YES成功， NO失败
 */
+ (BOOL)checkTelNumber:(NSString *)telNumber;
/**
 *  判断省份证号是否合法
 *
 *  @param idCard 省份证号
 *
 *  @return 匹配结果，YES成功， NO失败
 */
+ (BOOL)checkUserIdCard:(NSString *)idCard;

// 判断手势密码是否存在
+ (BOOL)checkIsPass;



/**
 *  返回你要计算的宽度和高度
 *
 *  @param size 你要计算文本的宽度和高度，如果你要计算高度，就这样写cgSizeMake(100, 0)；如果你要计算宽度，就这样写cgSizeMake(0, 12)
 *  @param dic  文本的属性
 *
 *  @return 你要计算的高度或者宽度
 */

- (float)backResultStrWithSize:(CGSize)size dic:(NSDictionary *)dic ;

/**
 *  把给的金钱，转换为大写金额
 */
+ (NSString *)digitUppercaseWithMoney:(NSString *)money;

@end
