//
//  RQLoginView.h
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RQLoginModel.h"
@class RQLoginViewModel;

@interface RQLoginView : UIView

@property(nonatomic,strong)UITextField *accountTextField;
@property (nonatomic, strong) UITextField *pasTextField;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) RQLoginViewModel *loginViewModel;
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *pas;

@property (nonatomic, strong) RQLoginModel *loginModel;

- (instancetype)initWithFrame:(CGRect)frame initWithViewModel:(RQLoginViewModel *)loginViewModel;

@end
