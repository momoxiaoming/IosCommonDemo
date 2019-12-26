//
//  AFHttpSessionClient.m
//  ChatApp
//
//  Created by 张小明 on 2017/2/13.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import "AFHttpSessionClient.h"


@implementation AFHttpSessionClient

+(instancetype)sharedClient{

    static AFHttpSessionClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFHttpSessionClient alloc] initWithBaseURL:nil];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.requestSerializer=[AFHTTPRequestSerializer serializer];
        _sharedClient.responseSerializer=[AFHTTPResponseSerializer serializer];
        
    });
    
    
  
    return _sharedClient;
}


-(void)post:(NSString *)url parameters:(id)parameters actionBlock:(void (^)(id, NSError *))block{
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters: nil error:nil];

    
    req.timeoutInterval= 5;

    [req addValue:@"application/text" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPBody:[parameters dataUsingEncoding:NSUTF8StringEncoding]];  //必须转为二进制nsdata才能发送
    [[self dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            block(responseObject,error);
        }] resume];
    
}





@end
