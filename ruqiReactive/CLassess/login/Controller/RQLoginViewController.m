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
    RQLoginView *loginView = [[RQLoginView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:loginView];

}

@end
