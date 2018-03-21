//
//  RQTabBarController.m
//  ruqiReactive
//
//  Created by 王文文 on 2018/3/21.
//  Copyright © 2018年 wangwen. All rights reserved.
//

#import "RQTabBarController.h"

#import "RQHomeViewController.h"
#import "RQCategoryViewController.h"
#import "RQMeViewController.h"
#import "RQCartViewController.h"

@interface RQTabBarController ()

@end

@implementation RQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildController];
}

-(void)setupChildController {
    RQHomeViewController *homeVc = [[RQHomeViewController alloc] init];
    [self addChildViewController:homeVc title:@"首页" imageName:@"tabbar_home"];
    
    RQCategoryViewController *messvc = [[RQCategoryViewController alloc] init];
    [self addChildViewController:messvc title:@"消息" imageName:@"tabbar_message_center"];
    
    RQCartViewController *findVC = [[RQCartViewController alloc] init];
    [self addChildViewController:findVC title:@"发现" imageName:@"tabbar_discover"];
    
    RQMeViewController *meVC = [[RQMeViewController alloc] init];
    [self addChildViewController:meVC title:@"我的" imageName:@"tabbar_profile"];
    
}

-(void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName {
    
    childController.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    self.tabBar.tintColor = [UIColor orangeColor];
    
    RQNavController *nav = [[RQNavController alloc] initWithRootViewController:childController];
    [self addChildViewController:nav];

    
}

@end
