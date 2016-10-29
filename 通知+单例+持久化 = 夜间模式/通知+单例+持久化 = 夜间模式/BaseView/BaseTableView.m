//
//  BaseTableView.m
//  通知+单例+持久化 = 夜间模式
//
//  Created by 殷殷明静 on 16/10/29.
//  Copyright © 2016年 YMJ. All rights reserved.
//

#import "BaseTableView.h"
#import "ThemeManager.h"
@implementation BaseTableView
- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self applyTheme];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applyTheme) name:kThemeManagerDidChangeThemeNotification object:nil];
    }
    return self;
}
- (void)applyTheme {
    if ([[ThemeManager defaultManager].currentThemeName isEqualToString:@"Dark"]) {
        self.backgroundColor = [UIColor colorWithRed:0.15 green:0.15 blue:0.2 alpha:1];
        self.separatorColor = [UIColor colorWithRed:0.11 green:0.11 blue:0.16 alpha:1];
        self.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    } else {
        self.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1];
        self.separatorColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.91 alpha:1];
        self.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
