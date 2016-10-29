//
//  NavigationController.m
//  通知+单例+持久化 = 夜间模式
//
//  Created by 殷殷明静 on 16/10/29.
//  Copyright © 2016年 YMJ. All rights reserved.
//

#import "NavigationController.h"
#import "ThemeManager.h"
#import "UIImage+Helpers.h"
@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self applyTheme];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applyTheme) name:kThemeManagerDidChangeThemeNotification object:nil];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return [[ThemeManager defaultManager].currentThemeName isEqualToString:@"Dark"] ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)applyTheme {
    if ([[ThemeManager defaultManager].currentThemeName isEqualToString:@"Dark"]) {
        [self.navigationBar setBackgroundImage:[UIImage imageFilledWithColor:[UIColor colorWithRed:0.12 green:0.12 blue:0.16 alpha:1]] forBarMetrics:UIBarMetricsDefault];
        self.navigationBar.shadowImage = [UIImage imageFilledWithColor:[UIColor colorWithRed:0.11 green:0.11 blue:0.16 alpha:1]];
//        self.navigationBar.tintColor = [UIColor colorWithRed:0.38 green:0.38 blue:0.44 alpha:1];
        self.navigationBar.tintColor = [UIColor cyanColor];
        self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:0.74 green:0.77 blue:0.82 alpha:1]};
    } else {
        [self.navigationBar setBackgroundImage:[UIImage imageFilledWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
        self.navigationBar.shadowImage = [UIImage imageFilledWithColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.91 alpha:1]];
//        self.navigationBar.tintColor = [UIColor colorWithRed:0.73 green:0.73 blue:0.84 alpha:1];
        self.navigationBar.tintColor = [UIColor orangeColor];
        self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:0.23 green:0.25 blue:0.27 alpha:1]};
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
