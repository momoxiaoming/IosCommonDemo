//
//  BaseAppDelegate.h
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/20.
//  Copyright © 2019 张小明. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface BaseAppDelegate  : UIResponder<UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (instancetype)sharedAppDelegate;

@end

NS_ASSUME_NONNULL_END
