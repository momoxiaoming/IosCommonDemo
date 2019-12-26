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

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    @autoreleasepool
    {
        viewController.hidesBottomBarWhenPushed = YES;
        [[self navigationViewController] pushViewController:viewController animated:animated];
    }
}

// 获取当前活动的navigationcontroller
- (UINavigationController *)navigationViewController
{
    UIWindow *window = self.window;
    if ([window.rootViewController isKindOfClass:[UINavigationController class]])
    {
        return (UINavigationController *)window.rootViewController;
    }
    else if ([window.rootViewController isKindOfClass:[UITabBarController class]])
    {
        UIViewController *selectVc = [((UITabBarController *)window.rootViewController) selectedViewController];
        if ([selectVc isKindOfClass:[UINavigationController class]])
        {
            return (UINavigationController *)selectVc;
        }
    }
    return nil;
}

- (UIViewController *)topViewController
{
    UINavigationController *nav = [self navigationViewController];
    return nav.topViewController;
}
- (UIViewController *)popViewController:(BOOL)animated
{
    return [[self navigationViewController] popViewControllerAnimated:animated];
}


- (void)presentViewController:(UIViewController *)vc animated:(BOOL)animated completion:(void (^)(void))completion
{
    UIViewController *top = [self topViewController];
    
    if (vc.navigationController == nil)
    {
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        [top presentViewController:nav animated:animated completion:completion];
    }
    else
    {
        [top presentViewController:vc animated:animated completion:completion];
    }
    
}
- (void)dismissViewController:(UIViewController *)vc animated:(BOOL)animated completion:(void (^)(void))completion
{
    if (vc.navigationController != [BaseAppDelegate sharedAppDelegate].navigationViewController)
    {
        [vc dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self popViewController:animated];
    }
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
