//
//  JYTabBarButton.m
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/3.
//  Copyright © 2016年 顾金跃. All rights reserved.
//
//图标比例
#define JYTabBarButtonImageRatio 0.6
#import "JYTabBarButton.h"

@implementation JYTabBarButton
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
//        //按钮选中时候的背景图片
//        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_slider_os7"] forState:UIControlStateSelected];
        
        //按钮的图片居中
        self.imageView.contentMode=UIViewContentModeCenter;
        
        //按钮的文字居中
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        //按钮的文字大小
        self.titleLabel.font=[UIFont systemFontOfSize:12];
        //设置按钮文字的颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW=contentRect.size.width;
    CGFloat imageH=contentRect.size.height*JYTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY=contentRect.size.height*JYTabBarButtonImageRatio;
    CGFloat titleW=contentRect.size.width;
    CGFloat titleH=contentRect.size.height-titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
}


//返回一张自由拉伸的图片
-(UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image=[UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
//按钮取消高亮效果
-(void)setHighlighted:(BOOL)highlighted
{
    
}

@end
