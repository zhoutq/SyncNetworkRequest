//
//  NetWorkRequest.h
//  NetworkSynchronizeTest
//
//  Created by zhoutq on 17/3/13.
//  Copyright © 2017年 www.feinno.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFNetworking.h>

@interface NetWorkRequest : NSObject

+ (void)requestWithUrl:(NSString *)url
               success:(void (^)(id result))success
               failure:(void (^)(id result))failure;

@end
