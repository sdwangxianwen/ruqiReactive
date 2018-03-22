//
//  RQLoginViewModel.h
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQBaseViewModel.h"
#import "RQLoginModel.h"

@interface RQLoginViewModel : RQBaseViewModel

@property (nonatomic, strong) RQLoginModel *loginModel;


-(void)loginNetWorking;

@end
