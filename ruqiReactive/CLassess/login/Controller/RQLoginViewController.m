//
//  RQLoginViewController.m
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/21.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQLoginViewController.h"
#import "RQLoginViewModel.h"
#import "RQLoginView.h"
#import "RQLoginModel.h"

@interface RQLoginViewController ()

@property(nonatomic,strong)RQLoginModel *model;
@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *pasw;

@end

@implementation RQLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUi];
}

-(void)setupUi {
    RQLoginViewModel *viewModel = [[RQLoginViewModel alloc] init];
    RQLoginView *loginView = [[RQLoginView alloc] initWithFrame:self.view.bounds initWithViewModel:viewModel];
    [self.view addSubview:loginView];
    
//    [loginView.pasTextField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
//        self.pasw = x;
//    }];
//    [loginView.accountTextField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
//        self.model.account = x;
//        self.account = x;
//    }];
//    [[loginView.loginBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
//
//        RQLoginViewModel *viewModel = [[RQLoginViewModel alloc] init];
//        [viewModel loginNetWorkingWith:self.model.account pas:self.model.pasword];
//    }];
   
}

@end
