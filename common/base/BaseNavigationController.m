//
//  BaseNavigationController.m
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/23.
//  Copyright © 2019 张小明. All rights reserved.
//

#import "BaseNavigationController.h"
#import "Common.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize
{
    if (self == [BaseNavigationController class]) {
        UINavigationBar *bar = [UINavigationBar appearance];
        
        [bar setBackgroundColor:[UIColor whiteColor]];
        [bar setTintColor:[UIColor blackColor]];
        [bar setBarTintColor: DEF_RGB_COLOR(@"#F5F5F5", 1)];
        [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:DEF_RGB_COLOR(@"#333333 ",1)}];
        

    }
}

@end
