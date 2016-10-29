//
//  MJViewController.m
//  通知+单例+持久化 = 夜间模式
//
//  Created by 殷殷明静 on 16/10/29.
//  Copyright © 2016年 YMJ. All rights reserved.
//

#import "MJViewController.h"
#import "ThemeManager.h"
#import "MJTableCell.h"
@interface MJViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISwitch *nightModeSwitch;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.nightModeSwitch.on = [[ThemeManager defaultManager].currentThemeName isEqualToString:@"Dark"];
    [self initNavigationItems];
    [self.tableView registerNib:[UINib nibWithNibName:@"MJTableCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"1"];
    self.tableView.rowHeight = 70;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MJTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
    cell.mj_titleLaebl.text = [NSString stringWithFormat:@"文本%ld",indexPath.row];
    [cell.mj_button setTitle:[NSString stringWithFormat:@"按钮%ld",indexPath.row] forState:UIControlStateNormal];
    return cell;
}
- (void)initNavigationItems {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"前进" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"后退" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.title = @"标题";
}
- (IBAction)nightModeSwitchDidChange:(id)sender {
    // 延时应用主题以避免开关动画卡顿。
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[ThemeManager defaultManager] setThemeName:self.nightModeSwitch.on ? @"Dark" : @"Default"];
    });

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
