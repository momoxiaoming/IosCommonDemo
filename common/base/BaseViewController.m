//
//  BaseViewController.m
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/19.
//  Copyright © 2019 张小明. All rights reserved.
//

#import "BaseViewController.h"
#import "Common.h"
#define naviTColor DEF_RGB_COLOR(@"#ffffff", 1)  //导航栏颜色
#define bg_color DEF_RGB_COLOR(@"#f3f3f3", 1)  //页面颜色
#define title_color DEF_RGB_COLOR(@"#000000", 1)  //标题颜色



//app主色调s
#define normalColors [UIColor colorWithRed:255/255.0 green:97/255.0 blue:49/255.0 alpha:1]
#define oldNormalColors [UIColor colorWithRed:255/255.0 green:221/255.0 blue:0/255.0 alpha:1]
#define Line_Cor [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1]

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 11.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.view.backgroundColor =bg_color;

    
  
    NSLog(@"DEF_STATUS_HEIGHT:%f",DEF_STATUS_HEIGHT);
    NSLog(@"DEF_NAV_HEIGHT:%f",DEF_NAV_HEIGHT);
    
}

-(void)isHidenNavigationBar:(BOOL)hiden{
    self.navigationController.navigationBar.hidden = hiden;
}


/**
 push 返回
 */
-(void)goPushBack{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
