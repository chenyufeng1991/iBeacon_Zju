//
//  UIBarButtonItem+JY.h
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/4.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JY)
+(UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;
@end
