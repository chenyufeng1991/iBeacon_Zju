//
//  JYLoginView.m
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/3.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import "JYLoginView.h"
@interface JYLoginView()

- (IBAction)dismissGo:(id)sender;
- (IBAction)loginGo:(id)sender;
@end

@implementation JYLoginView
+(instancetype)loginXib
{
    return [[[NSBundle mainBundle]loadNibNamed:@"loginView" owner:nil options:nil]lastObject];
}
- (IBAction)dismissGo:(id)sender
{
    if([self.delegate respondsToSelector:@selector(dismissGo)])
    {
        [self.delegate dismissGo];
    }
}

- (IBAction)loginGo:(id)sender
{
    if([self.delegate respondsToSelector:@selector(loginGo)])
    {
        [self.delegate loginGo];
    }
}
@end
