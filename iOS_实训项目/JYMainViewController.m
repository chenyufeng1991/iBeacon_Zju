//
//  JYMainViewController.m
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/3.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import "JYMainViewController.h"
#import "UIBarButtonItem+JY.h"
#import "JYMainTableViewCell.h"
#import "JYMainModel.h"
#import "JYHeaderView.h"
#import "JYFooterView.h"

@interface  JYMainViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIImageView *zoomImageView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation JYMainViewController

//数据懒加载
-(NSMutableArray *)dataArray
{
    if(_dataArray==nil)
    {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"MainPList" ofType:@"plist"];
        NSArray *dictArray=[NSArray arrayWithContentsOfFile:path];
        //将dictArray里面的所有字典转变成模型对象，放到新的数组中
        self.dataArray=[NSMutableArray array];
        for(NSDictionary *dict in dictArray)
        {
            //创建模型对象
            JYMainModel *dataModel=[JYMainModel mainDict:dict];
            [self.dataArray addObject:dataModel];
        }
    }
    return _dataArray;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    //1.设置导航栏
    [self setupNavBar];
    
     [self tableView];
    
     //2.创建UITableView
    UITableView *tableView=[[UITableView alloc]init];
    tableView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    tableView.contentInset=UIEdgeInsetsMake(200, 0, 0, 0);
    
    UIImageView *zoomImageView=[[UIImageView alloc]init];
    [zoomImageView setImage:[UIImage imageNamed:@"dianshang"]];
    zoomImageView.frame=CGRectMake(0, -200, self.view.frame.size.width, 200);
    [tableView addSubview:zoomImageView];
    self.zoomImageView=zoomImageView;
    //高度改变宽度也会跟着改变
    zoomImageView.contentMode=UIViewContentModeScaleAspectFill;
    //设置autoresizesSubview让子类自动布局
    zoomImageView.autoresizesSubviews=YES;
    
    tableView.showsVerticalScrollIndicator=NO;
    tableView.tableHeaderView=[JYHeaderView jyHeaderView];
    tableView.tableFooterView=[JYFooterView jyFooterView];
    [tableView sendSubviewToBack:zoomImageView];
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
        self.navigationController.navigationBarHidden=YES;
    }
    else if(y>-150)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.navigationController.navigationBarHidden=NO;
        }];
    }
}
-(void)setupNavBar
{
    self.navigationController.navigationBarHidden=YES;
    //self.navigationController.navigationBar.translucent=YES;
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
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *cellID=@"cellID";
    JYMainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if(cell==nil)
    {
        NSLog(@"创建%ld",indexPath.row);
//        cell=[[JYMainTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell=[JYMainTableViewCell jyMainTableViewCell];
    }
    JYMainModel *dataModel=self.dataArray[indexPath.row];
    
    cell.marketImage.image=[UIImage imageNamed:dataModel.marketImage];
    cell.marketName.text=dataModel.marketName;
    cell.marketDistance.text=dataModel.marketDistance;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  150;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]init];
    view.frame=CGRectMake(0, 0, self.view.frame.size.width, 80);
    view.backgroundColor=[UIColor orangeColor];
    return view;
}
@end
