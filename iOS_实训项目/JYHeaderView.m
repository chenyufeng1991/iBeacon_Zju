//
//  JYHeaderView.m
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/4.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import "JYHeaderView.h"

@implementation JYHeaderView
+(instancetype)jyHeaderView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"JYHeaderView" owner:nil options:nil]lastObject];
}
@end
