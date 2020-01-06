//
//  BaseViewController.m
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/19.
//  Copyright © 2019 张小明. All rights reserved.
//

#import "BaseViewController.h"
#import "Common.h"
#import "ViewTools.h"


#define naviTColor DEF_RGB_COLOR(@"#ffffff", 1)  //导航栏颜色
#define bg_color DEF_RGB_COLOR(@"#f3f3f3", 1)  //页面颜色
#define title_color DEF_RGB_COLOR(@"#000000", 1)  //标题颜色



//app主色调s
#define normalColors [UIColor colorWithRed:255/255.0 green:97/255.0 blue:49/255.0 alpha:1]
#define oldNormalColors [UIColor colorWithRed:255/255.0 green:221/255.0 blue:0/255.0 alpha:1]
#define Line_Cor [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1]

@interface BaseViewController ()
@property (nonatomic,strong)UILabel *titleLabel;
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
    [self isHidenNavigationBar:YES];
    [self navtion];
}

- (void)setTitle:(NSString *)title{
    if(self.titleLabel!=nil){
         self.titleLabel.text=title;
    }
   
}

-(void)navtion{
    NSLog(@"状态栏高度:%f",DEF_STATUS_HEIGHT);
    NSLog(@"导航栏栏高度:%f",DEF_NAV_HEIGHT);
    NSLog(@"和高度:%f",DEF_NAV_AND_STATUS_HEIGHT);
    
    self.navtionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, DEF_STATUS_HEIGHT+DEF_NAV_HEIGHT)];
    self.navtionView.backgroundColor = naviTColor;
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.text = @"编辑资料";
    [self.titleLabel setFont:[UIFont systemFontOfSize:16]];
    
    self.titleLabel.textColor = title_color;
    self.titleLabel.frame = CGRectMake(0,DEF_STATUS_HEIGHT,DEF_SCREEN_WIDTH,DEF_NAV_HEIGHT);
    
    // label.center = navtion.center;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.navtionView addSubview:self.titleLabel];
    
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    returnBtn.frame = CGRectMake(10,DEF_NAV_HEIGHT/2-20+DEF_STATUS_HEIGHT,40,40);
    returnBtn.imageEdgeInsets = UIEdgeInsetsMake(12.5, 0, 12.5, 25);
    [returnBtn setImage:[UIImage imageNamed:@"icon_arrow_leftsssa.png"] forState:UIControlStateNormal];
    
    [returnBtn addTarget:self action:@selector(doReturn) forControlEvents:UIControlEventTouchUpInside];
    [self.navtionView addSubview:returnBtn];
    
    [ViewTools lineViewWithFrame:CGRectMake(0, self.navtionView.height-1, DEF_SCREEN_WIDTH, 1) andColor:DEF_RGB_COLOR(@"#f3f3f3", 1) andView:self.navtionView];
    
    [self.view addSubview:self.navtionView];
    
    
    if(self.navigationController.viewControllers.count<2){
        returnBtn.hidden=YES;
    }else{
        returnBtn.hidden=NO;
    }
}

-(void)doReturn{
    [self toBack];
}



-(void)changRootController:(UIViewController*)viewController{
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    [UIApplication sharedApplication].delegate.window.rootViewController = nav;
}


-(void)isHidenNavigationBar:(BOOL)hiden{
    self.navigationController.navigationBar.hidden = hiden;
}
-(void)toBack{
    
    if (self.presentingViewController) {
        //模态弹出使用此方法销毁
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        //push弹出使用此方法处理
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)toBackTargetController:(UIViewController*)controller{
    
    if (self.presentingViewController) {
        
        NSLog(@"当前控制器属于模态弹出,无法通过使用该方法跳转");
    } else {
        //push弹出使用此方法处理
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)goPushNext:(UIViewController*)targetController{
    
    [self.navigationController pushViewController:targetController animated:YES];
}
@end
