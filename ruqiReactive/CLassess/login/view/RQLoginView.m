//
//  RQLoginView.m
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQLoginView.h"
#import "RQLoginViewModel.h"
#import "RQLoginModel.h"
#import "NSArray+HJImages.h"

@interface RQLoginView ()
@property (nonatomic, strong) UIImageView *backImage;
@end

@implementation RQLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
         RQLoginViewModel *viewModel = [[RQLoginViewModel alloc] init];
        self.viewModel = viewModel;
        [self backImage];
        [self accountTextField];
        [self pasTextField];
        [self loginBtn];
        
        
    }
    return self;
}

-(UIImageView *)backImage {
    if (!_backImage) {
        _backImage = [[UIImageView alloc] init];
        [self addSubview:_backImage];
        _backImage.animationImages = [NSArray hj_imagesWithLocalGif:@"login_bg_gif_01" expectSize:self.bounds.size];
        [_backImage startAnimating];
        [_backImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _backImage;
}


-(UITextField *)accountTextField {
    if (!_accountTextField) {
        _accountTextField = [[UITextField alloc] init];
        [self addSubview:_accountTextField];
        _accountTextField.placeholder = @"请输入账号";
        _accountTextField.borderStyle = UITextBorderStyleRoundedRect;
        [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.left.offset(60);
            make.right.offset(-60);
            make.centerY.equalTo(self.mas_centerY).offset(-40);
        }];
        
        [_accountTextField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            
            self.viewModel.loginModel.account = x;
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
            make.left.offset(60);
            make.right.offset(-60);
            make.top.equalTo(_accountTextField.mas_bottom).offset(20);
        }];
   
        [_pasTextField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            
            self.viewModel.loginModel.pasword = x;
           
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
        _loginBtn.layer.cornerRadius = 4;
        _loginBtn.clipsToBounds = YES;
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.width.mas_equalTo(200);
            make.top.equalTo(_pasTextField.mas_bottom).offset(40);
        }];
        
        [[_loginBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self logbtnClick];
        }];
    }
    return _loginBtn;
}
-(void)logbtnClick {
    if (self.viewModel.loginModel.account.length == 0 ||self.viewModel.loginModel.pasword.length == 0 ) {
        [SVProgressHUD showErrorWithStatus:@"账号或密码错误"];
    } else {
         [self.viewModel loginNetWorking];
    }
   
}
@end
