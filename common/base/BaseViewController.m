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
    self.view.backgroundColor =DEF_PAGE_BG_COLOR;
    [self isHidenNavigationBar:YES];
    [self navtion];
    self.contentView=[[UIView alloc]initWithFrame:CGRectMake(0, DEF_NAV_AND_STATUS_HEIGHT, DEF_SCREEN_WIDTH, DEF_SCREEN_HEIGHT)];
    
    [self.view addSubview:self.contentView];
}

- (void)setTitle:(NSString *)title{
    if(self.titleLabel!=nil){
         self.titleLabel.text=title;
    }
   
}

-(void)navtion{
    
    
    self.navtionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, DEF_STATUS_HEIGHT+DEF_NAV_HEIGHT)];
    self.navtionView.backgroundColor = DEF_NAV_BG_COLOR;
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.text = @"编辑资料";
    [self.titleLabel setFont:[UIFont systemFontOfSize:16]];
    
    self.titleLabel.textColor = DEF_NAV_TITLE_COLOR;
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
