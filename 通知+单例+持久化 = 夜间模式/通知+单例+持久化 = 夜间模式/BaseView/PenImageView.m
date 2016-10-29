//
//  PenImageView.m
//  通知+单例+持久化 = 夜间模式
//
//  Created by 殷殷明静 on 16/10/29.
//  Copyright © 2016年 YMJ. All rights reserved.
//

#import "PenImageView.h"
#import "ThemeManager.h"
@implementation PenImageView
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
        self.image = [UIImage imageNamed:@"pen"];
    } else {
        self.image = [UIImage imageNamed:@"pen-2"];
        
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
