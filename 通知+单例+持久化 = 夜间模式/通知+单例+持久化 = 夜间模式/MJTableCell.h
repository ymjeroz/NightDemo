//
//  MJTableCell.h
//  通知+单例+持久化 = 夜间模式
//
//  Created by 殷殷明静 on 16/10/29.
//  Copyright © 2016年 YMJ. All rights reserved.
//

#import "BaseTableViewCell.h"


@interface MJTableCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UIButton *mj_button;
@property (weak, nonatomic) IBOutlet UILabel *mj_titleLaebl;



@end
