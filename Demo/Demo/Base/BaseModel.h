//
//  BaseModel.h
//  XiangMuLianXI
//
//  Created by 张琦 on 16/5/30.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
@property (nonatomic, copy) NSString *MyId;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
