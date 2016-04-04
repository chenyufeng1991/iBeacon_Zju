//
//  JYMainViewController.m
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/3.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import "JYMainViewController.h"
#import "UIBarButtonItem+JY.h"

@interface  JYMainViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIImageView *zoomImageView;
@end

@implementation JYMainViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    //1.设置导航栏
    [self setupNavBar];
    
     //2.创建UITableView
    UITableView *tableView=[[UITableView alloc]init];
    tableView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    tableView.contentInset=UIEdgeInsetsMake(250, 0, 0, 0);
    
    UIImageView *zoomImageView=[[UIImageView alloc]init];
    [zoomImageView setImage:[UIImage imageNamed:@"dianshang"]];
    zoomImageView.frame=CGRectMake(0, -250, self.view.frame.size.width, 250);
    [tableView addSubview:zoomImageView];
    self.zoomImageView=zoomImageView;
    //高度改变宽度也会跟着改变
    zoomImageView.contentMode=UIViewContentModeScaleAspectFill;
    //设置autoresizesSubview让子类自动布局
    zoomImageView.autoresizesSubviews=YES;
    
    NSLog(@"%lf %lf",self.view.frame.origin.y,tableView.frame.origin.y);
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y=scrollView.contentOffset.y;
    if(y<-200)
    {
        CGRect frame=self.zoomImageView.frame;
        frame.origin.y=y;
        frame.size.height=-y;
        self.zoomImageView.frame=frame;
    }
}
-(void)setupNavBar
{
    self.navigationController.navigationBarHidden=YES;
    self.navigationController.navigationBar.alpha=0.3;
    //1.左边按钮
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithIcon:@"navigationbar_friendsearch_os7" highIcon:@"navigationbar_friendsearch_highlighted_os7" target:self action:@selector(findFriend)];
    
    //2.右边按钮
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithIcon:@"navigationbar_pop_os7" highIcon:@"navigationbar_pop_highlighted_os7" target:self action:@selector(pop)];
    
    
    //3.中间按钮
}
-(void)findFriend
{
    NSLog(@"定位");
}
-(void)pop
{
    NSLog(@"扫码");
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text=@"gujinyue";
    cell.imageView.image=[UIImage imageNamed:@"LaunchImage"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  60;
}
@end
