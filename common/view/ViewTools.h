//
//  ViewTools.h
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/19.
//  Copyright © 2019 张小明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextNoDataView.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewTools : NSObject

+(void)showTextNoData:(UIView *)superView text:(NSString *)text ;

+(void)hiddenTextNoData:(UIView *)superView;

/** 显示无数据/无网络 */
+(void)showImgNoData:(UIView *)superView imgName:(NSString *)imgName text:(NSString *)text;
/** 隐藏无数据/无网络 */
+(void)hiddenImgNoData:(UIView *)superView;

/** 指示器显示 */
+(void)indictorShow:(UIView *)superView text:(NSString*)text;
/** 指示器消失 */
+(void)indictorHide:(UIView *)superView;

@end

NS_ASSUME_NONNULL_END
