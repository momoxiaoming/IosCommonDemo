//
//  BaseViewController.h
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/19.
//  Copyright © 2019 张小明. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
{
    NSString * _title;  //导航栏标题
}
@property (nonatomic,strong)UIView * navtionView;




/**
 隐藏导航栏
 */
-(void)isHidenNavigationBar:(BOOL)hiden;

/**
 返回上一层控制器, 模态和push都支持
 */
-(void)toBack;

/**
 跳转到栈中某个特定的控制器,只支持push过来的控制器
 */
-(void)toBackTargetController:(UIViewController*)controller;
/**
 push 前往
 */
-(void)goPushNext:(UIViewController*)targetController;

/**
 修改根控制器
 */
-(void)changRootController:(UIViewController*)viewController;
@end

NS_ASSUME_NONNULL_END
