//
//  JYMainModel.h
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/4.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYMainModel : NSObject
//商场图片
@property(nonatomic,copy)NSString *marketImage;
//商场名称
@property(nonatomic,copy)NSString *marketName;
//商场距离
@property(nonatomic,copy)NSString *marketDistance;

+(instancetype)mainDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
