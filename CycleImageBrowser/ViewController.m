//
//  ViewController.m
//  CycleImageBrowser
//
//  Created by 王月超 on 2017/8/1.
//  Copyright © 2017年 heiqiu. All rights reserved.
//

#import "ViewController.h"
#import "LWActiveIncator.h"
#import "LWAlertView.h"
#import "LWActionSheetView.h"
#import "BrowserViewController.h"
#import "PaomadengController.h"
#import "YUMainTableViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,LWActionSheetViewDelegate>
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *titleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"hey";
    self.view.backgroundColor = [UIColor whiteColor];
    self.myTable.frame = CGRectMake(0, 0, screen_width, screen_height);
    [self.view addSubview:self.myTable];
}

#pragma mark ==========tableView协议方法==========
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.textLabel.textColor = randomColor;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0 ) {
        [self showActiveIncator];
    }else if (indexPath.row == 1){
        [self showBrowser];
    }else if (indexPath.row == 2){
        [self showActionSheet];
    }else if (indexPath.row == 3){
        [self showAlert];
    }else if (indexPath.row == 4){
        [self setPaomadeng];
    }else if (indexPath.row == 5){
        [self setYYModel];
    }else if (indexPath.row == 6){
        [self showAnimation];
    }
}
- (void)showAnimation{
    YUMainTableViewController *vc = [YUMainTableViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)setYYModel{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}





- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [LWActiveIncator hideInViwe:self.view];
}



- (void)showActiveIncator{
    [LWActiveIncator showInView:self.view backgroundColor:[UIColor whiteColor]];
}



- (void)showBrowser{
    BrowserViewController *vc = [BrowserViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showActionSheet{
    LWActionSheetView *actionSheet = [[LWActionSheetView alloc]initTilesArray:self.titleArray delegate:self];
    [actionSheet show];
}

- (void)lwActionSheet:(LWActionSheetView *)actionSheet didSelectedButtonWithIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
}
- (void)showAlert{
    [LWAlertView shoWithMessage:@"alert"];
}



- (void)setPaomadeng{
    PaomadengController *vc = [PaomadengController new];
    [self.navigationController pushViewController:vc animated:YES];
}



- (UITableView *)myTable{
    if(!_myTable){
        _myTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _myTable.delegate = self;
        _myTable.dataSource = self;
        _myTable.scrollEnabled = NO;
        _myTable.tableFooterView = [UIView new];
        [_myTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _myTable;
}
- (NSMutableArray *)titleArray{
    if(!_titleArray){
        _titleArray = [[NSMutableArray alloc]initWithObjects:@"ActiveIncator",@"ImageBrowser",@"ActionSheet",@"Alert",@"跑马灯",@"YYModel",@"animation",@"other", nil];
    }
    return _titleArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
