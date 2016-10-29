//
//  ThemeManager.m
//  通知+单例+持久化 = 夜间模式
//
//  Created by 殷殷明静 on 16/10/29.
//  Copyright © 2016年 YMJ. All rights reserved.
//

#import "ThemeManager.h"
#import <UIKit/UIKit.h>

@interface ThemeManager ()
@property (readwrite, copy, nonatomic) NSString * currentThemeName;
@end
@implementation ThemeManager
+ (instancetype)defaultManager {
    static ThemeManager *DefaultManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DefaultManager = [[ThemeManager alloc] init];
    });
    return DefaultManager;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.currentThemeName = [[NSUserDefaults standardUserDefaults] stringForKey:@"AppTheme"];
        if (!self.currentThemeName) {
            self.currentThemeName = @"Default";
        }
    }
    return self;
}
- (void)setThemeName:(NSString *)themeName {
    self.currentThemeName = themeName;
    [[NSUserDefaults standardUserDefaults] setObject:themeName forKey:@"AppTheme"];
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeManagerDidChangeThemeNotification object:nil];
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
    } completion:nil];
}
@end
