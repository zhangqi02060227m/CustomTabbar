//
//  AFNetworkToll.m
//  
//
//  Created by 张琦 on 15/11/6.
//  Copyright © 2015年 张琦. All rights reserved.
//
#import "AFNetworkTool.h"
#import "AFNetworking.h"
@implementation AFNetworkTool

+ (void)getUrl:(NSString *)url
          body:(id)body
      response:(ZHResponseStyle)style
requestheadFile:(NSDictionary *)headFile
       isCache:(BOOL)isCache
       success:(void (^)(NSURLSessionDataTask *task, id jsonDict))success
       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (headFile) {
        for (NSString *key in headFile.allKeys) {
            [manager.requestSerializer setValue:headFile[key] forHTTPHeaderField:key];
        }
    }
    manager.requestSerializer.timeoutInterval = 10;
    
    switch (style) {
        case ZHResponseStyleJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case ZHResponseStyleXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case ZHResponseStyleData:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
    }
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript", nil]];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [manager GET:url parameters:body success:^(NSURLSessionDataTask *task, id responseObject) {
        // 防止为空的情况出现
        // 如果请求成功 , 回调请求到的数据 , 同时 在这里 做本地缓存
        if (isCache) {
            [AFNetworkTool createSW_Caches];
            NSString *path;
            if (body) {
                NSString *urlStr = [NSString stringWithFormat:@"%@%@", url, [self convertToJSONData:body]];
                path = [NSString stringWithFormat:@"%ld.plist", (unsigned long)[urlStr hash]];

            } else {
                path = [NSString stringWithFormat:@"%ld.plist", (unsigned long)[url hash]];

            }

            NSString *path_doc = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"SW_Caches"];
            [NSKeyedArchiver archiveRootObject:responseObject toFile:[path_doc stringByAppendingPathComponent:path]];
//            NSDictionary *dic = responseObject;
//            [dic writeToFile:[path_doc stringByAppendingPathComponent:path] atomically:YES];
        }
        if (success) {
            success(task, responseObject);
        }

        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        /* *********************************** */
        // 在这里读取本地缓存
        if (isCache) {
            NSString *path;
            if (body) {
                NSString *urlStr = [NSString stringWithFormat:@"%@%@", url, [self convertToJSONData:body]];
                path = [NSString stringWithFormat:@"%ld.plist", (unsigned long)[urlStr hash]];
                
            } else {
                path = [NSString stringWithFormat:@"%ld.plist", (unsigned long)[url hash]];
                
            }

//            NSString *path = [NSString stringWithFormat:@"%ld.plist", (unsigned long)[url hash]];
            NSString *path_doc = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"SW_Caches"];
//            id result = [NSDictionary dictionaryWithContentsOfFile:[path_doc stringByAppendingPathComponent:path]];
            id result = [NSKeyedUnarchiver unarchiveObjectWithFile:[path_doc stringByAppendingPathComponent:path]];
            if (result) {
                success(task, result);
            } else {
                failure(task,error);
            }

        }
        if (failure) {
            failure(task, error);
        }
    }];
}



+ (void)postUrlString:(NSString *)url
                 body:(id)body
             response:(ZHResponseStyle)style
            bodyStyle:(ZHRequestStyle)bodyStyle
      requestHeadFile:(NSDictionary *)headFile
              success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
              failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    switch (style) {
        case ZHResponseStyleJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case ZHResponseStyleXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case ZHResponseStyleData:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    switch (bodyStyle) {
        case ZHRequestJSON:
            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            break;
        case ZHRequestString:
            [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, id parameters, NSError *__autoreleasing *error) {
                return parameters;
            }];
        case ZHRequestDefault:
            break;
            
        default:
            break;
    }
    if (headFile) {
        for (NSString *key in headFile.allKeys) {
            [manager.requestSerializer setValue:headFile[key] forHTTPHeaderField:key];
        }
    }
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript", nil]];
    
    [manager POST:url parameters:body success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(task, responseObject);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(task, error);

        }

        
    }];
    
}


+ (void)createSW_Caches {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *pathDocuments = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"SW_Caches"];
    // 判断文件夹是否存在，如果不存在，则创建
    if (![fileManager fileExistsAtPath:pathDocuments]) {
        [fileManager createDirectoryAtPath:pathDocuments withIntermediateDirectories:YES attributes:nil error:nil];
    }
//    else {
//        [fileManager removeItemAtPath:pathDocuments error:nil];
//    }
}


+ (NSString*)convertToJSONData:(id)infoDict
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:infoDict
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    NSString *jsonString = @"";
    
    if (! jsonData)
    {
        NSLog(@"Got an error: %@", error);
    }else
    {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
    
    [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return jsonString;
}



@end





