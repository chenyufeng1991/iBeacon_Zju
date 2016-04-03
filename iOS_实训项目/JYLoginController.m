//
//  JYLoginController.m
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/3.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import "JYLoginController.h"
#import "JYLoginView.h"
#import "JYAccount.h"

@interface JYLoginController()<JYLoginViewDelegate>

@end
@implementation JYLoginController
-(void)viewDidLoad
{
    [super viewDidLoad];
    JYLoginView *loginView=[JYLoginView loginXib];
    loginView.delegate=self;
    self.view=loginView;
}
-(void)loginGo
{
    JYAccount *account=[[JYAccount alloc]init];
    account.username=@"gujinyue";
    account.password=@"123456";
    
    //归档
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *file=[doc stringByAppendingPathComponent:@"account.data"];
    [NSKeyedArchiver archiveRootObject:account toFile:file];
   
    NSLog(@"登录成功：%@",file);
}
-(void)dismissGo
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
