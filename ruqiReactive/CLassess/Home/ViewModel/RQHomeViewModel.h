//
//  RQHomeViewModel.h
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQBaseViewModel.h"

@interface RQHomeViewModel : RQBaseViewModel



//-(void)homeNetwork;
-(RACSignal *)signalForGetHomeDataArr;

@end
