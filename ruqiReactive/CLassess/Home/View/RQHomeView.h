//
//  RQHomeView.h
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RQHomeView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, strong) RQBaseViewController *homeVC;

-(instancetype)initWithFrame:(CGRect)frame homeVc:(RQBaseViewController *)homeVc;

@end
