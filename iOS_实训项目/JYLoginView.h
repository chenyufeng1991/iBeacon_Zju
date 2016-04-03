//
//  JYLoginView.h
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/3.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JYLoginViewDelegate<NSObject>
@optional
-(void)loginGo;
-(void)dismissGo;
@end

@interface JYLoginView : UIView
+(instancetype)loginXib;
@property(nonatomic,weak)id<JYLoginViewDelegate>delegate;

@end
