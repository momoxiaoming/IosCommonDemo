//
//  AFHttpSessionClient.h
//  ChatApp
//
//  Created by 张小明 on 2017/2/13.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
@interface AFHttpSessionClient : AFHTTPSessionManager
+ (instancetype)sharedClient;

-(void)post:(NSString *) url parameters:(id)parameters actionBlock:(void (^)(id resObject, NSError *error))block;



@end
