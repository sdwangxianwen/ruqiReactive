//
//  RQLoginViewModel.m
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQLoginViewModel.h"

@implementation RQLoginViewModel


-(void)loginNetWorking {
    NSString *urlstring = [NSString stringWithFormat:@"%@open/userCenter/login/v1",SERVER_HOST_API];
    
    NSDictionary *dict = @{ @"phone": @"18618400540",
                            @"password":@"1234567",
                            @"type1": @"",
                            @"type2": @""};
    [[RQNetWorkManager shareInstance] loginNetWorkWith:urlstring parm:dict successBlock:^(id response) {
        NSLog(@"%@",response);
    } failureBlock:^(id failureObject, NSString *resultCode) {
        
    } errorBlock:^(NSError *error) {
        
    }];
    
}

@end
