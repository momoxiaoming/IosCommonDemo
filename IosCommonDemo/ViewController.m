//
//  ViewController.m
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/19.
//  Copyright © 2019 张小明. All rights reserved.
//

#import "ViewController.h"
#import "Common.h"
#import "SecondViewController.h"
#import "ViewTools.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor=[UIColor redColor];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(DEF_SCREEN_WIDTH/2-50, DEF_SCREEN_HEIGHT/2-25, 100, 50)];
    btn.backgroundColor=[UIColor blueColor];
    [btn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [btn setTitle:@"next" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    self.title=@"首页";
    

    
    [ViewTools indictorShow:self.view text:@"数据加载中"];
}
-(void)next{
    
    [[BaseAppDelegate sharedAppDelegate] pushViewController:[SecondViewController new] animated:YES];
}

@end
