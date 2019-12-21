//
//  BaseViewController.m
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/19.
//  Copyright © 2019 张小明. All rights reserved.
//

#import "BaseViewController.h"
#import "Common.h"
#define naviTColor DEF_RGB_COLOR(@"#333333", 1)

//app主色调s
#define normalColors [UIColor colorWithRed:255/255.0 green:97/255.0 blue:49/255.0 alpha:1]
#define oldNormalColors [UIColor colorWithRed:255/255.0 green:221/255.0 blue:0/255.0 alpha:1]
#define Line_Cor [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1]

@interface BaseViewController ()

@property (nonatomic,strong)UIView *naviView;
@property (nonatomic,strong)UIButton *returnBtn; //返回按钮
@property (nonatomic,strong)UILabel *titleL; //标题
@property (nonatomic,strong)UIButton *rightBtn; //右边按钮

@property (nonatomic,strong)UIView *nothingView; //
@property (nonatomic,strong)UIImageView *nothingImgV; //


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    self.navigationController.navigationBar.hidden = YES;
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 11.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.view.backgroundColor = [UIColor whiteColor];

    [self creatNavi];
  
}

- (void)creatNavi{
    _naviView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEF_SCREEN_WIDTH, 64+DEF_STATUS_HEIGHT)];
    _naviView.backgroundColor = naviTColor;
    [self.view addSubview:_naviView];
    
    _returnBtn = [UIButton buttonWithType:0];
    _returnBtn.frame = CGRectMake(0, 24+DEF_STATUS_HEIGHT, 40, 40);
    [_returnBtn setImage:[UIImage imageNamed:@"navi_backImg"] forState:0];
    [_returnBtn addTarget:self action:@selector(doReturn) forControlEvents:UIControlEventTouchUpInside];
    [_naviView addSubview:_returnBtn];
    
    _titleL = [[UILabel alloc]initWithFrame:CGRectMake(DEF_SCREEN_WIDTH/2-80, 34+DEF_STATUS_HEIGHT, 160, 20)];
    _titleL.font =[UIFont systemFontOfSize:15];
    _titleL.textColor = naviTColor;
    _titleL.textAlignment = NSTextAlignmentCenter;
    [_naviView addSubview:_titleL];
    
    _rightBtn = [UIButton buttonWithType:0];
    _rightBtn.frame =CGRectMake(_naviView.frame.size.width-30-10, _titleL.center.y+15, 30, 30);
    [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _rightBtn.hidden = YES;
    _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_rightBtn setTitleColor:normalColors forState:0];
    [_naviView addSubview:_rightBtn];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _naviView.height-1, DEF_SCREEN_WIDTH, 1)];
    lineView.backgroundColor = DEF_RGB_COLOR(@"#f5f5f5", 1);
    [_naviView addSubview:lineView];
}

- (void)doReturn{
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)nothingBtnClick{
    
}
- (void)rightBtnClick{
    
}


@end
