//
//  BaseModel.m
//  XiangMuLianXI
//
//  Created by 张琦 on 16/5/30.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "BaseModel.h"
@implementation BaseModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}

@end
