//
//  RQNetWorkManager.h
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(id response);
typedef void(^failureBlock)(id failureObject,NSString *resultCode);
typedef void(^errorBlock)(NSError *error);

@interface RQNetWorkManager : NSObject

+ (instancetype) shareInstance;

-(void)loginNetWorkWith:(NSString *)urlstring parm:(NSDictionary *)parm successBlock:(successBlock)successBlock failureBlock:(failureBlock)failureBlock errorBlock:(errorBlock)errorBlock;

@end
