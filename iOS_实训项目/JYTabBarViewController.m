//
//  JYTabBarViewController.m
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/3.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import "JYTabBarViewController.h"

#import "JYMainViewController.h"
#import "JYMMViewController.h"
#import "JYMeViewController.h"
#import "JYTabBar.h"
#import "JYNavigationController.h"

@interface JYTabBarViewController ()<JYTabBarDelegate>
//自定义的tabbar
@property(nonatomic,weak)JYTabBar *customTabBar;
@end

@implementation JYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.初始化tabbar
    [self setupTabbar];
    
    //2.初始化所有的子控制器
    [self setupAllChildControllers];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //NSLog(@"%@",self.tabBar.subviews);
    
    for(UIView *view in self.tabBar.subviews)
    {
        // NSLog(@"%@",view.superclass);
        if([view isKindOfClass:[UIControl class]])
        {
            [view removeFromSuperview];
        }
    }
}

-(void)setupAllChildControllers
{
    //1.喵街
    JYMainViewController *miaojie=[[JYMainViewController alloc]init];
    [self setupChildViewController:miaojie title:@"喵街" imageName:@"tabbar_home_os7" selectedImageName:@"tabbar_home_selected_os7"];
    
    //2.喵喵
    JYMMViewController *miaomiao=[[JYMMViewController alloc]init];
    [self setupChildViewController:miaomiao title:@"喵喵" imageName:@"tabbar_message_center_os7" selectedImageName:@"tabbar_message_center_selected_os7"];
    

    //3.我
    JYMeViewController *me=[[JYMeViewController alloc]init];
    [self setupChildViewController:me title:@"我" imageName:@"tabbar_profile_os7" selectedImageName:@"tabbar_profile_selected_os7"];
    
}

-(void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //1.控制器属性
    childVc.title=title;
    //2.设置图标
    childVc.tabBarItem.image=[UIImage imageNamed:imageName];
    //3.设置选中的图标
    //对于选中的图片,系统默认会渲染成蓝色,通过设置渲染模式可以使其保持原色而不渲染
    childVc.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //4.包装一个导航控制器
    JYNavigationController *nav=[[JYNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    //5.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

-(void)setupTabbar
{
    //自定义的tabbar完全覆盖系统的tabbar
    JYTabBar *customTabbar=[[JYTabBar alloc]init];
    //customTabbar.backgroundColor=[UIColor greenColor];
    customTabbar.frame=self.tabBar.bounds;
    customTabbar.delegate=self;
    
    [self.tabBar addSubview:customTabbar];
    self.customTabBar=customTabbar;
}

//实现代理
-(void)tabBar:(JYTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex=to;
}


@end
