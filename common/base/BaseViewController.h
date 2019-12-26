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


/**
 隐藏导航栏
 */
-(void)isHidenNavigationBar:(BOOL)hiden;

/**
 push 返回
 */
-(void)goPushBack;
@end

NS_ASSUME_NONNULL_END
