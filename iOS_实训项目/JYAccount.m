//
//  JYAccount.m
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/3.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import "JYAccount.h"

@implementation JYAccount

//从文件中解析对象的时候调用
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self=[super init])
    {
        self.username=[aDecoder decodeObjectForKey:@"username"];
        self.password=[aDecoder decodeObjectForKey:@"password"];
    }
    return self;
}

//将对象写入文件的时候调用
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.password forKey:@"password"];
}
@end
