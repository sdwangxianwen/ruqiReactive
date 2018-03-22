//
//  RQLoginViewModel.m
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQLoginViewModel.h"

@implementation RQLoginViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.loginModel = [[RQLoginModel alloc] init];
    }
    return self;
}

-(void)loginNetWorking {
    NSString *urlstring = [NSString stringWithFormat:@"%@open/userCenter/login/v1",SERVER_HOST_API];
    
    NSDictionary *dict = @{ @"phone": self.loginModel.account?:@"",
                            @"password":self.loginModel.pasword ?:@"",
                            @"type1": @"",
                            @"type2": @""};
    [[RQNetWorkManager shareInstance] loginNetWorkWith:urlstring parm:dict successBlock:^(id response) {
        NSLog(@"%@",response);
        if ([response[@"resultCode"] isEqualToString:@"SUC"]) {
            [UIApplication  sharedApplication].keyWindow.rootViewController = [[RQTabBarController alloc] init];
        };
    } failureBlock:^(id failureObject, NSString *resultCode) {
        
    } errorBlock:^(NSError *error) {
        
    }];
    
}

-(void)setLoginModel:(RQLoginModel *)loginModel {
    _loginModel = loginModel;
}

@end
