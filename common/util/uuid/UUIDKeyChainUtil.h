//
//  UUIDKeyChainUtil.h
//  Runner
//
//  Created by 张小明 on 2020/3/17.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UUIDKeyChainUtil : UIView
+(void)saveUUIDToKeyChain;
+(NSString *)readUUIDFromKeyChain;
@end

NS_ASSUME_NONNULL_END
