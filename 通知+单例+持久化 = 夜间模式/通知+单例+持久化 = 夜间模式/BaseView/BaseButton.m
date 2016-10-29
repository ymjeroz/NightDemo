//
//  BaseButton.m
//  通知+单例+持久化 = 夜间模式
//
//  Created by 殷殷明静 on 16/10/29.
//  Copyright © 2016年 YMJ. All rights reserved.
//

#import "BaseButton.h"
#import "ThemeManager.h"
@implementation BaseButton
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

        self.layer.borderColor = [UIColor colorWithRed:255 / 255.0 green:215 / 255.0 blue:0 / 255.0 alpha:1].CGColor;
        [self setTitleColor:[UIColor colorWithRed:0.74 green:0.77 blue:0.82 alpha:1] forState:UIControlStateNormal];
    } else {
        self.layer.borderColor = [UIColor colorWithRed:218 / 255.0 green:109 / 255.0 blue:242 / 255.0 alpha:1].CGColor;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
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
