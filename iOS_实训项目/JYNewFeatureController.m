//
//  JYNewFeatureController.m
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/3.
//  Copyright © 2016年 顾金跃. All rights reserved.
//
#define JYNewFeatureImageCount 4
#import "JYNewFeatureController.h"
#import "JYLoginController.h"

@interface JYNewFeatureController()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView  *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@end

@implementation JYNewFeatureController
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //1.添加UIScrollView
    self.scrollView=[[UIScrollView alloc]init];
    //设置frame
    self.scrollView.frame=self.view.bounds;
    //设置代理
    self.scrollView.delegate=self;
    
    //2.添加图片
    CGFloat imageW=self.scrollView.frame.size.width;
    CGFloat imageH=self.scrollView.frame.size.height;
    
    for(int i=0;i<JYNewFeatureImageCount;i++)
    {
        UIImageView *imageView=[[UIImageView alloc]init];
        if(self.view.frame.size.width==320)
        {
//            UIImageView *imageView=[[UIImageView alloc]init];
            //设置图片
            NSString *imageName=[NSString stringWithFormat:@"turial%d_320x480",i+1];
            imageView.image=[UIImage imageNamed:imageName];
            
            //设置frame
            CGFloat imageX=i*imageW;
            imageView.frame=CGRectMake(imageX, 0, imageW, imageH);
            [self.scrollView addSubview:imageView];
        }
        else if(self.view.frame.size.width==375)
        {
            //UIImageView *imageView=[[UIImageView alloc]init];
            //设置图片
            NSString *imageName=[NSString stringWithFormat:@"turial%d_375x667",i+1];
            imageView.image=[UIImage imageNamed:imageName];
            
            //设置frame
            CGFloat imageX=i*imageW;
            imageView.frame=CGRectMake(imageX, 0, imageW, imageH);
            [self.scrollView addSubview:imageView];
        }
        else if(self.view.frame.size.width==414)
        {
            //UIImageView *imageView=[[UIImageView alloc]init];
            //设置图片
            NSString *imageName=[NSString stringWithFormat:@"turial%d_414x736",i+1];
            imageView.image=[UIImage imageNamed:imageName];
            
            //设置frame
            CGFloat imageX=i*imageW;
            imageView.frame=CGRectMake(imageX, 0, imageW, imageH);
            [self.scrollView addSubview:imageView];
        }
        if(i==JYNewFeatureImageCount-1)
        {
            [self setupLastImageView:imageView];
        }
    }
    
    self.scrollView.contentSize=CGSizeMake(imageW*JYNewFeatureImageCount, 0);
    self.scrollView.showsHorizontalScrollIndicator=NO;
    //强制分页
    self.scrollView.pagingEnabled=YES;
    //不让ScrollView回弹
    self.scrollView.bounces=NO;
    
    //3.添加PageControl
    self.pageControl=[[UIPageControl alloc]init];
    self.pageControl.numberOfPages=JYNewFeatureImageCount;
    self.pageControl.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height-30);
    //设置宽高
    //self.pageControl.bounds=CGRectMake(0, 0, 100, 30);
    self.pageControl.userInteractionEnabled=NO;
    
    //设置圆点的颜色
    self.pageControl.currentPageIndicatorTintColor=[UIColor whiteColor];
    self.pageControl.pageIndicatorTintColor=[UIColor grayColor];
    
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //1.取出水平方向上滚动的距离
    CGFloat offsetX=scrollView.contentOffset.x;
    
    //2.取出页码
    double pageDouble=offsetX/scrollView.frame.size.width;
    int pageInt=(int)(pageDouble+0.5);
    
    self.pageControl.currentPage=pageInt;
}

-(void)setupLastImageView:(UIImageView *)imageView
{
    imageView.userInteractionEnabled=YES;
    
    UIButton *startButton=[[UIButton alloc]init];
    //[startButton setBackgroundImage:[UIImage imageNamed:@"LaunchImage"] forState:UIControlStateNormal];
    //[startButton setBackgroundImage:[UIImage imageNamed:@"LaunchImage"] forState:UIControlStateHighlighted];
    [startButton setTitle:@"开始逛街" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    //2.设置frame
    startButton.center=CGPointMake(imageView.frame.size.width/2, imageView.frame.size.height-70);
    startButton.bounds=CGRectMake(0, 0, 100, 60);
    [imageView addSubview:startButton];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
}

-(void)start
{
    //显示状态栏
    //[UIApplication sharedApplication].statusBarHidden=NO;
    
    JYLoginController *vc=[[JYLoginController alloc]init];
    //切换窗口的根控制器
//    self.view.window.rootViewController=vc;
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}
@end
