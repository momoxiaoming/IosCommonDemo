//
//  LoadingView.h
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/24.
//  Copyright © 2019 张小明. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoadingView : UIView
@property (weak, nonatomic) IBOutlet UILabel *loadText;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadView;

@end

NS_ASSUME_NONNULL_END
