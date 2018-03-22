//
//  RQHomeViewController.m
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/21.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQHomeViewController.h"
#import "RQHomeView.h"

@interface RQHomeViewController ()

@end

@implementation RQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RQHomeView *homeView = [[RQHomeView alloc] initWithFrame:CGRectZero homeVc:self];
    
    [self.view addSubview:homeView];
    [homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}






@end
