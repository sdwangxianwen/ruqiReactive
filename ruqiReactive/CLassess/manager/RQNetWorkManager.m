//
//  RQNetWorkManager.m
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQNetWorkManager.h"

@implementation RQNetWorkManager


+ (instancetype) shareInstance{
    static RQNetWorkManager* _instance = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init] ;
    }) ;
    return _instance ;
}

@end
