//
//  ViewController.m
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/19.
//  Copyright © 2019 张小明. All rights reserved.
//

#import "ViewController.h"
#import "Common.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor redColor];
    
    UIView *textV=[[UIView alloc]initWithFrame:CGRectMake(20, 20, 100, 100)];
    
    textV.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:textV];
    
    DEF_VIEW_RADIUS(textV, 10, 0, [UIColor blackColor]);
    
    
    NSDictionary *dict=@{@"name":@"123"};
    
    NSString* str= DEF_DICT_TO_JSON(dict);

    
    
    NSLog(@"str==%@",DEF_STR_TO_B64(str));
    
    
}


@end
