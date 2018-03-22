//
//  RQCategoryCompleteList.h
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RQHpCategory,RQHpCategoryActivity;

@interface RQCategoryCompleteList : NSObject

@property (nonatomic, strong) RQHpCategory * hpCategory;
@property (nonatomic, strong) RQHpCategoryActivity * hpCategoryActivity;
@property (nonatomic, strong) NSArray * productItemList;

@end
