//
//  NetWorkRequest.m
//  NetworkSynchronizeTest
//
//  Created by zhoutq on 17/3/13.
//  Copyright © 2017年 www.feinno.com. All rights reserved.
//

#import "NetWorkRequest.h"

@implementation NetWorkRequest

+ (void)requestWithUrl:(NSString *)url
               success:(void (^)(id result))success
               failure:(void (^)(id result))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             success(nil);
         }
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             
             failure(error);
         }];
}

@end
