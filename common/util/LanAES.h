//
//  SecurityUtil.h
//  Yelloweb
//
//  Created by allen on 2016/12/26.
//  Copyright © 2016年 allen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LanAES : NSObject

#pragma mark - base64


+(NSString*)aes128_encrypt:(NSString *)text;
+(NSString*)aes128_decrypt:(NSString *)text;
@end
