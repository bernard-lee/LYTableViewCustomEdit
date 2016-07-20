//
//  LYTableViewController.m
//  LYTableViewCustomEdit
//
//  Created by Bernard Lee on 7/18/16.
//  Copyright © 2016 Bernard Lee. All rights reserved.
//

#import "LYTableViewController.h"
#import "LYCustomTableViewCell.h"

static NSString *identifier = @"reuseIdentifier";

@interface LYTableViewController () <UITableViewDataSource, UITableViewDelegate, LYCustomTableViewCellDelegate>

@property(nonatomic, strong) NSArray *records;

@end

@implementation LYTableViewController

@synthesize pseudoEdit = _pseudoEdit;

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.records = @[@"custom cell 1", @"custom cell 2", @"custom cell 3", @"custom cell 4"];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    _pseudoEdit = YES;
    
    [super setEditing:editing animated:animated];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.records.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LYCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[LYCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // Configure the cell...
    cell.delegate = self;
    cell.titleLabel.text = self.records[indexPath.row];
    [cell setEditing:self.editing];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

@end
