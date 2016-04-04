//
//  JYMainTableViewCell.m
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/4.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import "JYMainTableViewCell.h"

@implementation JYMainTableViewCell

+(instancetype)jyMainTableViewCell
{
    return [[[NSBundle mainBundle]loadNibNamed:@"JYMainCell" owner:nil options:nil]lastObject];
}
@end
