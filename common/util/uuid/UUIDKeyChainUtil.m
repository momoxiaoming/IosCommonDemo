//
//  UUIDKeyChainUtil.m
//  Runner
//
//  Created by 张小明 on 2020/3/17.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "UUIDKeyChainUtil.h"
#import "KeychainItemWrapper.h"

@implementation UUIDKeyChainUtil
+(void)saveUUIDToKeyChain{
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithAccount:@"Identfier" service:@"AppName" accessGroup:nil];
    NSString *string = [keychainItem objectForKey: (__bridge id)kSecAttrGeneric];
    if([string isEqualToString:@""] || !string){
        [keychainItem setObject:[self getUUIDString] forKey:(__bridge id)kSecAttrGeneric];
    }
}

+(NSString *)readUUIDFromKeyChain{
    KeychainItemWrapper *keychainItemm = [[KeychainItemWrapper alloc] initWithAccount:@"Identfier" service:@"AppName" accessGroup:nil];
    NSString *UUID = [keychainItemm objectForKey: (__bridge id)kSecAttrGeneric];
    return UUID;
}

+(NSString *)getUUIDString
{
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef strRef = CFUUIDCreateString(kCFAllocatorDefault , uuidRef);
    NSString *uuidString = [(__bridge NSString*)strRef stringByReplacingOccurrencesOfString:@"-" withString:@""];
    CFRelease(strRef);
    CFRelease(uuidRef);
    return uuidString;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
