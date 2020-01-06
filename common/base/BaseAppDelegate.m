//
//  BaseAppDelegate.m
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/20.
//  Copyright © 2019 张小明. All rights reserved.
//

#import "BaseAppDelegate.h"
#import "BaseNavigationController.h"
@implementation BaseAppDelegate

+ (instancetype)sharedAppDelegate
{
    return [UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self configAppearance];
    return YES;
}


// 配置App中的控件的默认属性
- (void)configAppearance
{
    
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UILabel appearance] setBackgroundColor:[UIColor clearColor]];
    [[UILabel appearance] setTextColor:[UIColor blackColor]];
    [[UIButton appearance] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}


@end
