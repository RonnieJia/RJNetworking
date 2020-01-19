//
//  RJdViewController.m
//  RJNetworking_Example
//
//  Created by jia on 2020/1/19.
//  Copyright © 2020 Ronniejia. All rights reserved.
//

#import "RJdViewController.h"
#import "RJRegViewController.h"

@interface RJdViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *dataArray;
@end

@implementation RJdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - tableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RJRegViewController *a=[RJRegViewController new];
    a.modalPresentationStyle = 0;
    if (indexPath.row == 0) {
        a.count = 2;
        
    }
    a.index = indexPath.row;
    [self presentViewController:a animated:YES completion:nil];
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [@[@"注册"] mutableCopy];
    }
    return _dataArray;
}
@end
