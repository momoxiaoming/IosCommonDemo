//
//  ViewTools.m
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/19.
//  Copyright © 2019 张小明. All rights reserved.
//

#import "ViewTools.h"
#import "Common.h"
#import "TextNoDataView.h"
#import "TextAndImageView.h"
#import "LoadingView.h"

@implementation ViewTools

#pragma mark - 无数据提示
+(void)hiddenImgNoData:(UIView *)superView {
    if (!superView) {
        superView = [UIApplication sharedApplication].keyWindow;
    }
    for (UIView *subv in superView.subviews) {
        if ([subv isKindOfClass:[TextAndImageView class]]) {
            [subv removeFromSuperview];
        }
    }
    
}

+(void)showImgNoData:(UIView *)superView imgName:(NSString *)imgName text:(NSString *)text{
    for (UIView *subv in superView.subviews) {
        if ([subv isKindOfClass:[TextAndImageView class]]) {
            [subv removeFromSuperview];
        }
    }
    /**
     *  公用类尺寸谨慎修改
     */
    TextAndImageView *_noData = [[[NSBundle mainBundle]loadNibNamed:@"TextAndImageView" owner:nil options:nil]firstObject];
    _noData.frame = CGRectMake(0, 0, superView.width, superView.height);
    _noData.imgView.image = [UIImage imageNamed:imgName];
    _noData.noDataText.text = text;
    [superView addSubview:_noData];
}
 
/*****************************   无数据(文字)   **********************************/

+(void)showTextNoData:(UIView *)superView text:(NSString *)text {
    for (UIView *subv in superView.subviews) {
        if ([subv isKindOfClass:[TextNoDataView class]]) {
            [subv removeFromSuperview];
        }
    }
 
   TextNoDataView *_noData = [[[NSBundle mainBundle]loadNibNamed:@"TextNoDataView" owner:nil options:nil]firstObject];
   _noData.frame = CGRectMake(0, 0, superView.width, superView.height);

    _noData.textNoData.text = text;
    [superView addSubview:_noData];
    
    
}
+(void)hiddenTextNoData:(UIView *)superView {
    if (!superView) {
        superView = [UIApplication sharedApplication].keyWindow;
    }
    for (UIView *subv in superView.subviews) {
        if ([subv isKindOfClass:[TextNoDataView class]]) {
            [subv removeFromSuperview];
        }
    }
}


+(void)indictorShow:(UIView *)superView text:(NSString*)text{
    
   for (UIView *subv in superView.subviews) {
        if ([subv isKindOfClass:[LoadingView class]]) {
            [subv removeFromSuperview];
        }
    }
    /**
     *  公用类尺寸谨慎修改
     */
    LoadingView *_noData = [[[NSBundle mainBundle]loadNibNamed:@"LoadingView" owner:nil options:nil]firstObject];
    _noData.frame = CGRectMake(0, 0, superView.width, superView.height);
    _noData.loadText.text = text;
    [superView addSubview:_noData];
    
    [_noData.loadView startAnimating];
}

+(void)indictorHide:(UIView *)superView{
    
    if (!superView) {
           superView = [UIApplication sharedApplication].keyWindow;
       }
       for (UIView *subv in superView.subviews) {
           if ([subv isKindOfClass:[LoadingView class]]) {
             LoadingView *pubV = (LoadingView *)subv;
               [pubV.loadView stopAnimating];
               [pubV.loadView setHidesWhenStopped:YES];
               pubV.hidden = YES;
               
               [subv removeFromSuperview];
           }
       }
    
  
}


+ (void)lineViewWithFrame:(CGRect)frame andColor:(UIColor *)color andView:(UIView *)view{
    UIView *lineView = [[UIView alloc]initWithFrame:frame];
    lineView.backgroundColor = color;
    [view addSubview:lineView];
}
@end
