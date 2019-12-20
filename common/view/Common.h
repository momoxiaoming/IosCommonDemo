//
//  common.h
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/19.
//  Copyright © 2019 张小明. All rights reserved.
//

#ifndef common_h
#define common_h

#import "UIView+Additions.h"
#import "BaseAppDelegate.h"
#import "BaseViewController.h"



#ifdef DEBUG
#define NSLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
 #define NSLog(...)
 #endif

//WeakSelf、StrongSelf
#define DEF_WEAKSELF(type)    __weak typeof(type) weak##type = type
#define DEF_STRONGSELF(type)  __strong typeof(type) type = weak##type

//--------------手机相关---------------
//屏幕宽度
#define DEF_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define DEF_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//状态栏高度
#define DEF_STATUS_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height-20)
//导航栏高度
#define DEF_NAV_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height-20)


//颜色,透明度 DEF_RGB_COLOR(@"#333333",1)
#define DEF_RGB_COLOR(_STR_,a) ([UIColor colorWithRed:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(1, 2)] UTF8String], 0, 16)] intValue] / 255.0 green:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(3, 2)] UTF8String], 0, 16)] intValue] / 255.0 blue:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(5, 2)] UTF8String], 0, 16)] intValue] / 255.0 alpha:a])

//--------------view相关---------------
//圆角
#define DEF_VIEW_RADIUS(View, Radius, Width, UIColor)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[UIColor CGColor]]


//--------------沙盒目录文件路径---------------
// 获取沙盒主目录路径
#define DEF_BOX_HOME_PATH = NSHomeDirectory();
//获取沙盒 Document
#define DEF_BOX_DOCUMENT_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Library
#define DEF_BOX_LIBRARY_PATH [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
//获取沙盒 Cache
#define DEF_BOX_CACHE_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
//获取temp
#define DEF_TEMP_PATH NSTemporaryDirectory()



//----------------判断当前的iPhone设备/系统版本---------------
// 判断是否为iPhone
#define DEF_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
// 判断是否为iPad
#define DEF_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
// 判断是否为ipod
#define DEF_IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

//----------------判断机型 根据尺寸---------------
// 判断是否为 iPhone 4/4S - 3.5 inch
#define iPhone4_4S [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 480.0f
// 判断是否为 iPhone 5/5SE - 4.0 inch
#define iPhone5_5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
// 判断是否为iPhone 6/6S/7/8 - 4.7 inch
#define iPhone6_6S [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
// 判断是否为iPhone 6Plus/6SPlus/7P/8P - 5.5 inch
#define iPhone6Plus_8Plus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
// 判断是否为iPhoneX - 5.8 inch
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否为iPhoneXS - 5.8 inch
#define iPhoneXS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否为iPhoneXR - 6.1 inch
#define iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否为iPhoneXS MAX - 6.5 inch
#define iPhoneXSMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)


//--------------生成随机数---------------
#define DEF_RANDNUM_INT(i) arc4random()%i   // [0,i) 范围内随机数
#define DEF_RANDNUM_FROMTO(i,j) (i + (arc4random() % (j – i + 1)))

//主线程中操作
//dispatch_main_async_safe(^{
//    // UI in Main Thread
//});
#ifndef DEF_DISPATCH_MAIN_ASYNC_SAFE
#define dispatch_main_async_safe(block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}
#endif


//-----------一些代码片段常用用法---------------------
//字典转json字符串
#define DEF_DICT_TO_JSON(dict) ([[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:dict options:0 error:nil]\
encoding:NSUTF8StringEncoding])

//nsData转string
#define DEF_NSDATA_TO_STR(data) ([[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding])
//字符串转b64
#define DEF_STR_TO_B64(str) ([[str dataUsingEncoding: NSUTF8StringEncoding] base64EncodedStringWithOptions:0])
//b64 str转NSData
#define DEF_B64_TO_DATA(str) ([[NSData alloc]initWithBase64EncodedString:str options:0])




//--------- - 判断数据是否为空---------------
// 字符串是否为空
#define DEF_STR_ISNULL(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
// 数组是否为空
#define DEF_ARRAY_ISNULL(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0 ||[array isEqual:[NSNull null]])
// 字典是否为空
#define DEF_DICT_ISNULL(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0 || [dic isEqual:[NSNull null]])
// 是否是空对象
#define DEF_OBJ_ISNULL(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))



#endif /* common_h */
