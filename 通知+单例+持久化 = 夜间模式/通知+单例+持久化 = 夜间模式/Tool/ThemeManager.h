//
//  ThemeManager.h
//  通知+单例+持久化 = 夜间模式
//
//  Created by 殷殷明静 on 16/10/29.
//  Copyright © 2016年 YMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString * const kThemeManagerDidChangeThemeNotification = @"kThemeManagerDidChangeThemeNotification";
@interface ThemeManager : NSObject
@property (readonly, copy, nonatomic) NSString *currentThemeName;
+ (instancetype)defaultManager;
- (void)setThemeName:(NSString *)themeName;
@end
