//
//  RQHomeView.m
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/22.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQHomeView.h"
#import "RQHomeViewModel.h"
#import "RQHpCategory.h"
#import "RQHpCategoryActivity.h"

@implementation RQHomeView
- (instancetype)initWithFrame:(CGRect)frame homeVc:(RQBaseViewController *)homeVc
{
    self = [super initWithFrame:frame];
    self.homeVC = homeVc;
    if (self) {
        [self createViewModel];
        
    }
    return self;
}

-(void)createViewModel {
    RQHomeViewModel *homeViewModel = [[RQHomeViewModel alloc] init];
    [[homeViewModel signalForGetHomeDataArr] subscribeNext:^(id  _Nullable x) {
        self.dataArr = [NSArray yy_modelArrayWithClass:[RQHpCategory class] json:x];
        [self homeTableView];
    }];

}

-(UITableView *)homeTableView {
    if (!_homeTableView) {
        _homeTableView = [[UITableView alloc] initWithFrame:self.bounds style:(UITableViewStylePlain)];
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
        [self addSubview:_homeTableView];
        [_homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _homeTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RQBaseViewController *vc = [[RQBaseViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.homeVC.navigationController pushViewController:vc animated:YES];
}

@end
