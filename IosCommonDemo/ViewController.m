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
   
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(DEF_SCREEN_WIDTH/2-50, DEF_SCREEN_HEIGHT/2-25, 100, 50)];
    btn.backgroundColor=[UIColor blueColor];
    [btn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [btn setTitle:@"next" forState:UIControlStateNormal];
    [self.contentView addSubview:btn];
    
    self.title=@"首页";
    

    
//    [ViewTools showTextNoData:self.view text:@"数据加载中..."];
}
-(void)next{
    
    SecondViewController *second=[[SecondViewController alloc]init];
    [self goPushNext:second];
}

@end
