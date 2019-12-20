//
//  ViewTools.m
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/19.
//  Copyright © 2019 张小明. All rights reserved.
//

#import "ViewTools.h"
#import "PublicView.h"
#import "Common.h"

@implementation ViewTools


/*****************************   数据图形视图(start)   **********************************/
/*****************************       无数据(带图)      **********************************/
+(void)publicHide:(UIView *)superView {
    if (!superView) {
        superView = [UIApplication sharedApplication].keyWindow;
    }
    for (UIView *subv in superView.subviews) {
        if ([subv isKindOfClass:[PublicView class]]) {
            [subv removeFromSuperview];
        }
    }
}

#pragma mark - 无数据提示
+(void)hiddenImgNoData:(UIView *)superView {
    [self publicHide:superView];
}

+(void)showImgNoData:(UIView *)superView name:(NSString *)imgName text:(NSString *)text{
    for (UIView *subv in superView.subviews) {
        if ([subv isKindOfClass:[PublicView class]]) {
            [subv removeFromSuperview];
        }
    }
    /**
     *  公用类尺寸谨慎修改
     */
    PublicView *_noData = [[[NSBundle mainBundle]loadNibNamed:@"PublicView" owner:nil options:nil]objectAtIndex:1];
    _noData.frame = CGRectMake(0, 0, superView.width, superView.height);
    _noData.noDataIV.image = [UIImage imageNamed:imgName];
    _noData.noDataTextL.text = text;
    [superView addSubview:_noData];
}

/*****************************   无数据(文字)   **********************************/

+(void)showTextNoData:(UIView *)superView text1:(NSString *)str1 text2:(NSString *)str2 {
    for (UIView *subv in superView.subviews) {
        if ([subv isKindOfClass:[PublicView class]]) {
            [subv removeFromSuperview];
        }
    }
    /**
     *  公用类尺寸谨慎修改
     */
    PublicView *_noData = [[[NSBundle mainBundle]loadNibNamed:@"PublicView" owner:nil options:nil]objectAtIndex:2];
    _noData.frame = CGRectMake(0, 0, superView.width, superView.height);
    _noData.noDataText1.text = str1;
    _noData.noDataText2.text = str2;
    [superView addSubview:_noData];
    
    
}
+(void)hiddenTextNoData:(UIView *)superView {
    [self publicHide:superView];
}

@end
