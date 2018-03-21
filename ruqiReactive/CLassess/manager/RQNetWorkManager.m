//
//  RQNetWorkManager.m
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQNetWorkManager.h"
#import <PPNetworkHelper.h>

@implementation RQNetWorkManager


+ (instancetype) shareInstance{
    static RQNetWorkManager* _instance = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init] ;
    }) ;
    return _instance ;
}


-(void)loginNetWorkWith:(NSString *)urlstring parm:(NSDictionary *)parm successBlock:(successBlock)successBlock failureBlock:(failureBlock)failureBlock errorBlock:(errorBlock)errorBlock {
    [self postRequesNoCachetWithUrl:urlstring dict:parm successBlock:successBlock failureBlock:failureBlock errorBlock:errorBlock];
}


-(void)postRequesNoCachetWithUrl:(NSString *)url dict:(NSDictionary *)dict successBlock:(successBlock)successBlock failureBlock:(failureBlock)failureBlock errorBlock:(errorBlock)errorBlock {
    
    NSString *uid = [[NSUUID UUID] UUIDString];
    NSDictionary *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"data"];
    NSString *requestId =[uid stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSString *userId = data[@"id"];
    NSDate *localDate = [NSDate date]; //获取当前时间
    NSString *timestamp = [NSString stringWithFormat:@"%ld", (long)[localDate timeIntervalSince1970]];  //转化为UNIX时间戳
    NSString *securityKey = [[NSUserDefaults standardUserDefaults] objectForKey:@"securityKey"];
    NSString *localityId = [[NSUserDefaults standardUserDefaults] objectForKey:@"localityId"];
    
    NSString *deviceNum = [NSString stringWithFormat:@"ios%@",[[UIDevice currentDevice] identifierForVendor]] ;
    NSString *device = [deviceNum stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    
    NSDictionary *parmenters = @{@"requestId": requestId,
                                 @"userId": userId?:@"",
                                 @"securityKey":securityKey?:@"",
                                 @"timestamp": timestamp,
                                 @"deviceNum": device,
                                 @"data":dict,
                                 @"localityId" : localityId ?:@""
                                 };
    
    
    
    [PPNetworkHelper setRequestSerializer:(PPRequestSerializerJSON)];
    [PPNetworkHelper setRequestTimeoutInterval:8];
    [PPNetworkHelper POST:url parameters:parmenters success:^(id responseObject) {
       successBlock(responseObject);
       
    } failure:^(NSError *error) {
       errorBlock(error);
    }];
}

@end
