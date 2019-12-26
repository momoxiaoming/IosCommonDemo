//
//  TextAndImageView.h
//  IosCommonDemo
//
//  Created by 张小明 on 2019/12/24.
//  Copyright © 2019 张小明. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextAndImageView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *noDataText;

@end

NS_ASSUME_NONNULL_END
