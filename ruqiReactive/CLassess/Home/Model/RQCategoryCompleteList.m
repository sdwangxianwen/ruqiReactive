//
//  RQCategoryCompleteList.m
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQCategoryCompleteList.h"
#import "RQHpCategoryActivity.h"
#import "RQHpCategory.h"

@implementation RQCategoryCompleteList
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"hpCategory":@"RQHpCategory",@"hpCategoryActivity":@"RQHpCategoryActivity"};
}
@end
