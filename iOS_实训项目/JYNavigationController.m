//
//  JYNavigationController.m
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/3.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import "JYNavigationController.h"

@interface JYNavigationController ()

@end

@implementation JYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//当第一次使用这个类的时候才调用
+(void)initialize
{
    //1.设置导航栏主题
    //取出apperance对象
    UINavigationBar *navBar=[UINavigationBar appearance];
    
    //设置背景
    //[navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background_os7"] forBarMetrics:UIBarMetricsDefault];
    //[UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
    
    //设置标题属性
    //NSDictionary *textAttrs=[NSDictionary dictionary];
    //textAttrs[UITextAttributeTextColor]=[UIColor greenColor];
    //textAttrs[UITextAttributeFont]=[UIFont systemFontOfSize:30];
    //[navBar setTitleTextAttributes:textAttrs];
    
    //2.设置导航栏按钮的主题
    UIBarButtonItem *item=[UIBarButtonItem appearance];
    //    //设置背景
    //    [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //    [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    //设置文字属性
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor]=[UIColor orangeColor];
    textAttrs[UITextAttributeFont]=[UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
}

//通过重写pushViewController,当跳转时隐藏底部
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count>0)
    {
        viewController.hidesBottomBarWhenPushed=YES;
    }
    [super pushViewController:viewController animated:YES];
}


@end
