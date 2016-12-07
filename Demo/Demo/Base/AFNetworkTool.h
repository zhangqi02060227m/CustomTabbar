//
//  AFNetworkToll.h
//  
//
//  Created by 张琦 on 15/11/6.
//  Copyright © 2015年 张琦. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ZHResponseStyle) {
    ZHResponseStyleJSON,
    ZHResponseStyleXML,
    ZHResponseStyleData,
};

typedef NS_ENUM(NSUInteger, ZHRequestStyle) {
    ZHRequestJSON,
    ZHRequestString,
    ZHRequestDefault
};

@interface AFNetworkTool : NSObject
/**
 *  get请求
 *
 *  @param url      请求的URL
 *  @param body     请求的Body体，没有填nil
 *  @param style    返回数据的类型，JSON, XML, DATA
 *  @param headFile 请求头，没有填nil
 *  @param isCache  是否需要缓存
 *  @param success  成功的block
 *  @param failure  失败的block
 */
+ (void)getUrl:(NSString *)url
          body:(id)body
      response:(ZHResponseStyle)style
requestheadFile:(NSDictionary *)headFile
       isCache:(BOOL)isCache
       success:(void (^)(NSURLSessionDataTask *task, id jsonDict))success
       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
/**
 *  post请求
 *
 *  @param url       请求的URL
 *  @param body      请求的Body体，没有填nil
 *  @param style     返回数据的类型，JSON, XML, DATA
 *  @param bodyStyle 发送请求数据的类型，JSON, NSString
 *  @param headFile  请求头，没有填nil
 *  @param success   成功的block
 *  @param failure   失败的block
 */
+ (void)postUrlString:(NSString *)url
                 body:(id)body
             response:(ZHResponseStyle)style
            bodyStyle:(ZHRequestStyle)bodyStyle
      requestHeadFile:(NSDictionary *)headFile
              success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
              failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
@end
