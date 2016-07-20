//
//  ViewController.m
//  LYTableViewCustomEdit
//
//  Created by Bernard Lee on 7/18/16.
//  Copyright © 2016 Bernard Lee. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "LYTableViewController.h"

@interface ViewController ()

@property(nonatomic, strong) UIButton *tableViewBtn;

@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableViewBtn];
    
    self.tableViewBtn.backgroundColor = [UIColor blueColor];
    [self.tableViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
    
    [self.tableViewBtn addTarget:self action:@selector(tableViewBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Response methods

- (void)tableViewBtnClick
{
    LYTableViewController *tableVC = [[LYTableViewController alloc] init];
    UINavigationController *Navi = [[UINavigationController alloc] initWithRootViewController:tableVC];
    [self presentViewController:Navi animated:YES completion:nil];
}

#pragma mark - Getters and Setters

- (UIButton *)tableViewBtn
{
    if (nil != _tableViewBtn) {
        return _tableViewBtn;
    }
    
    _tableViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_tableViewBtn setTitle:@"TableViewController" forState:UIControlStateNormal];
    
    return _tableViewBtn;
}

@end
