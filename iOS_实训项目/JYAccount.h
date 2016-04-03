//
//  JYAccount.h
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/3.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYAccount : NSObject<NSCoding>
//用户名
@property(nonatomic,copy)NSString *username;
//密码
@property(nonatomic,copy)NSString *password;
@end
