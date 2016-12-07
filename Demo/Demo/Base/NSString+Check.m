//
//  NSString+Check.m
//  XiangMuLianXI
//
//  Created by 张琦 on 16/5/26.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "NSString+Check.h"


@implementation NSString (Check)

#pragma mark - 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *)telNumber
{
    // 因为新增的手机号有17开头的
    NSString *pattern = @"^1[3578]\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}


#pragma mark 正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString *)password
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}


#pragma 正则匹配用户身份证号15或18位
+ (BOOL)checkUserIdCard:(NSString *)idCard
{
    NSString *pattern = @"^((\\d{15})|(\\d{17}[xX]))$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}

#pragma mark - 判断手势密码是否存在
+ (BOOL)checkIsPass {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *strPass = [user valueForKey:@"passLockStr"];
    if (strPass != nil && ![strPass isEqualToString:@""]) {
        return YES;
    }
    return NO;
}

+ (NSString *)digitUppercaseWithMoney:(NSString *)money {
    // 首先转化成标准格式
    NSMutableString *tempStr=[[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%.2f",[money doubleValue]]];
    // 位
    NSArray *carryArr1=@[@"元", @"拾", @"佰", @"仟", @"万", @"拾", @"佰", @"仟", @"亿", @"拾", @"佰", @"仟", @"兆", @"拾", @"佰", @"仟" ];
    NSArray *carryArr2=@[@"分",@"角"];
    // 数字
    NSArray *numArr=@[@"零", @"壹", @"贰", @"叁", @"肆", @"伍", @"陆", @"柒", @"捌", @"玖"];
    // 分割字符串
    NSArray *temarr = [tempStr componentsSeparatedByString:@"."];
    // 小数点前的数值字符串
    NSString *firstStr=[NSString stringWithFormat:@"%@",temarr[0]];
    // 小数点后的数值字符串
    NSString *secondStr=[NSString stringWithFormat:@"%@",temarr[1]];
    
    // 是否拼接了“零”
    bool zero=NO;
    // 拼接数据的可变字符串
    NSMutableString *endStr=[[NSMutableString alloc] init];
    
    // 遍历firstStr
    
    for(int i = (int)firstStr.length; i > 0 ;i--) {
        //取最高位数
        NSInteger MyData=[[firstStr substringWithRange:NSMakeRange(firstStr.length-i, 1)] integerValue];
        // 去除一些特殊格式的字符串
        if ([numArr[MyData] isEqualToString:@"零"]) {
            if ([carryArr1[i-1] isEqualToString:@"万"]||[carryArr1[i-1] isEqualToString:@"亿"]||[carryArr1[i-1] isEqualToString:@"元"]||[carryArr1[i-1] isEqualToString:@"兆"]) {
                if (zero) {
                    endStr =[NSMutableString stringWithFormat:@"%@",[endStr substringToIndex:(endStr.length-1)]];
                    [endStr appendString:carryArr1[i-1]];
                    zero=NO;
                }else{
                    [endStr appendString:carryArr1[i-1]];
                    zero=NO;
                }
                if ([carryArr1[i-1] isEqualToString:@"万"]) {
                    if ([[endStr substringWithRange:NSMakeRange(endStr.length-2, 1)] isEqualToString:@"亿"]) {
                        endStr =[NSMutableString stringWithFormat:@"%@",[endStr substringToIndex:endStr.length-1]];
                    }
                    
                    if ([[endStr substringWithRange:NSMakeRange(endStr.length-2, 1)] isEqualToString:@"兆"]) {
                        endStr =[NSMutableString stringWithFormat:@"%@",[endStr substringToIndex:endStr.length-1]];
                    }
                    
                }
                if ([carryArr1[i-1] isEqualToString:@"亿"]) {
                    if ([[endStr substringWithRange:NSMakeRange(endStr.length-2, 1)] isEqualToString:@"兆"]) {
                        endStr =[NSMutableString stringWithFormat:@"%@",[endStr substringToIndex:endStr.length-1]];
                    }
                }
                
            }else{
                if (!zero) {
                    [endStr appendString:numArr[MyData]];
                    zero=YES;
                }
                
            }
            
        }else{
            //拼接数字
            [endStr appendString:numArr[MyData]];
            //拼接位
            [endStr appendString:carryArr1[i-1]];
            //不为“零”
            zero=NO;
        }
    }
    
    // 再遍历secondStr    角位----->分位
    if ([secondStr isEqualToString:@"00"]) {
        [endStr appendString:@"整"];
    } else {
        for(int i=(int)secondStr.length;i>0;i--) {
            //取最高位数
            NSInteger MyData=[[secondStr substringWithRange:NSMakeRange(secondStr.length-i, 1)] integerValue];
            
            [endStr appendString:numArr[MyData]];
            [endStr appendString:carryArr2[i-1]];
        }
    }
    if ([[endStr substringToIndex:1] isEqualToString:@"元"]) {
        [endStr replaceCharactersInRange:NSMakeRange(0, 1) withString:@"零元"];
    }
    return endStr;

}



- (float)backResultStrWithSize:(CGSize)size dic:(NSDictionary *)dic {
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    if (size.height == 0) {
        return rect.size.height;
    } else {
        return rect.size.width;
    }
    
}


@end
