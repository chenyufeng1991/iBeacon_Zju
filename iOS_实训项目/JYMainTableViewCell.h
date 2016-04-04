//
//  JYMainTableViewCell.h
//  iOS_实训项目
//
//  Created by 顾金跃 on 16/4/4.
//  Copyright © 2016年 顾金跃. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYMainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *marketImage;
@property (weak, nonatomic) IBOutlet UILabel *marketName;
@property (weak, nonatomic) IBOutlet UILabel *marketDistance;

+(instancetype)jyMainTableViewCell;
@end
