//
//  JYTabBar.m
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/3.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import "JYTabBar.h"
#import "JYTabBarButton.h"

@interface JYTabBar()

@property(nonatomic,weak)JYTabBarButton *selectedButton;

@end

@implementation JYTabBar


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        
    }
    return self;
}

-(void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    //1.创建按钮
    JYTabBarButton *button=[[JYTabBarButton alloc]init];
    [self addSubview:button];
    
    //2.设置数据
    button.item=item;
    
    //3.监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //4.默认选中第0个按钮
    if(self.subviews.count==1)
    {
        [self buttonClick:button];
    }
    
    
}

-(void)buttonClick:(JYTabBarButton *)button
{
    if([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)])
    {
        [self.delegate tabBar:self didSelectedButtonFrom:(int)self.selectedButton.tag to:(int)button.tag];
    }
    self.selectedButton.selected=NO;
    button.selected=YES;
    self.selectedButton=button;
}

//专门用来设置尺寸
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonY=0;
    CGFloat buttonW=self.frame.size.width/self.subviews.count;
    CGFloat buttonH=self.frame.size.height;
    for(int index=0;index<self.subviews.count;index++)
    {
        //1.取出按钮
        UIButton *button=self.subviews[index];
        
        //2.设置frame
        CGFloat buttonX=index*buttonW;
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //3.绑定tag
        button.tag=index;
    }
}

@end
