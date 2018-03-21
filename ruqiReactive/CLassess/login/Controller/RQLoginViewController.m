//
//  RQLoginViewController.m
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/21.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQLoginViewController.h"
#import "RQLoginViewModel.h"

@interface RQLoginViewController ()



@end

@implementation RQLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    RQLoginViewModel *viewModel = [[RQLoginViewModel alloc] init];
    [viewModel loginNetWorking];
}

@end
