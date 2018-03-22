//
//  RQLoginView.m
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQLoginView.h"
#import "RQLoginViewModel.h"

@interface RQLoginView ()

@end

@implementation RQLoginView

- (instancetype)initWithFrame:(CGRect)frame initWithViewModel:(RQLoginViewModel *)loginViewModel
{
    self = [super initWithFrame:frame];
    if (self) {
        [self accountTextField];
        [self pasTextField];
        [self loginBtn];
        
        
    }
    return self;
}




-(UITextField *)accountTextField {
    if (!_accountTextField) {
        _accountTextField = [[UITextField alloc] init];
        [self addSubview:_accountTextField];
        _accountTextField.placeholder = @"请输入账号";
        _accountTextField.borderStyle = UITextBorderStyleRoundedRect;
        [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self.mas_centerY).offset(-40);
        }];
        __weak typeof(self) weakSelf = self;
        [_accountTextField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            weakSelf.account = x;
            NSLog(@"%@",x);
        }];
    }
    return _accountTextField;
}

-(UITextField *)pasTextField {
    if (!_pasTextField) {
        _pasTextField = [[UITextField alloc] init];
        [self addSubview:_pasTextField];
        _pasTextField.placeholder = @"请输入密码";
        _pasTextField.borderStyle = UITextBorderStyleRoundedRect;
        [_pasTextField  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            
            make.top.equalTo(_accountTextField.mas_bottom).offset(20);
        }];
        __weak typeof(self) weakSelf = self;
        [_pasTextField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            weakSelf.pas = x;
        }];
    }
    return _pasTextField;
}

-(UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] init];
        [self addSubview:_loginBtn];
        [_loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
        [_loginBtn setBackgroundColor:[UIColor orangeColor]];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(_pasTextField.mas_bottom).offset(20);
        }];
        
        [[_loginBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self logbtnClick];
        }];
    }
    return _loginBtn;
}
-(void)logbtnClick {
    NSLog(@"%@",self.loginModel.pasword);
    RQLoginViewModel *viewModel = [[RQLoginViewModel alloc] init];
    [viewModel loginNetWorkingWith:self.account pas:self.pas];
}
@end
