//
//  JYMainModel.m
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/4.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import "JYMainModel.h"

@implementation JYMainModel
+(instancetype)mainDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if(self=[super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
