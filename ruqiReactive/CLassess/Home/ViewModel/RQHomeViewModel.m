//
//  RQHomeViewModel.m
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQHomeViewModel.h"



@implementation RQHomeViewModel

-(RACSignal *)signalForGetHomeDataArr {
    
    RACReplaySubject *subject = [RACReplaySubject subject];
    NSString *urlstring = [NSString stringWithFormat:@"%@open/productCenter/homePage/getHpCategoryCompleteList/v1",SERVER_HOST_API];
    NSDictionary *dict = [NSDictionary dictionary];
    [[RQNetWorkManager shareInstance] homeNetworkWith:urlstring parm:dict successBlock:^(id response) {
        NSLog(@"%@",response);
        NSDictionary *data = response[@"data"];
        [subject sendNext:data[@"hpCategoryCompleteList"]];
        
        
    } failureBlock:^(id failureObject, NSString *resultCode) {
        
    } errorBlock:^(NSError *error) {
        
    }];
    return subject;
}


@end
