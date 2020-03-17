//
//  KeychainItemWrapper.h
//  Runner
//
//  Created by 张小明 on 2020/3/17.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//  注意,该类必须在开启arc模式
// 方法:在build phases下的compile source中找到该文件,添加 -fno-objc-arc

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KeychainItemWrapper : NSObject
{
    NSMutableDictionary *keychainItemData;      // The actual keychain item data backing store.
    NSMutableDictionary *genericPasswordQuery;  // A placeholder for the generic keychain item query used to locate the item.
}

@property (nonatomic, retain) NSMutableDictionary *keychainItemData;
@property (nonatomic, retain) NSMutableDictionary *genericPasswordQuery;

// Designated initializer.
- (id)initWithAccount:(NSString *)account service:(NSString *)service accessGroup:(NSString *) accessGroup;

- (id)initWithIdentifier: (NSString *)identifier accessGroup:(NSString *) accessGroup;
- (void)setObject:(id)inObject forKey:(id)key;
- (id)objectForKey:(id)key;

// Initializes and resets the default generic keychain item data.
- (void)resetKeychainItem;

@end

NS_ASSUME_NONNULL_END
