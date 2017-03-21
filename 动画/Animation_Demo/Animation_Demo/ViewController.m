//
//  ViewController.m
//  Animation_Demo
//
//  Created by yangbin on 2017/2/8.
//  Copyright © 2017年 yangbin. All rights reserved.
//

#import "ViewController.h"
#import "YWBasicAnimController.h"



@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleArr = @[@[@{@"clsName":@"YWBasicAnimController",@"title":@"CABasicAnimation基础动画"},@{@"clsName":@"YWKeyframeAnimController",@"title":@"CAKeyframeAnimation基础动画"},@{@"clsName":@"YWDrawLineController",@"title":@"画线动画、线条递增、递减动画"},@{@"clsName":@"YWTransitionViewController",@"title":@"CATransition转场动画"},@{@"clsName":@"YWSpringAnimViewController",@"title":@"CASpringAnimation弹簧动画"}],@[@{@"clsName":@"YWDrawLineController",@"title":@"画线动画"},@{@"clsName":@"YWWaterWaveController",@"title":@"水波纹效果"},@{@"clsName":@"YWFireAnimController",@"title":@"粒子动画-火苗效果"}]];
    
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.myTableView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.titleArr[section] count];;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *dic = self.titleArr[indexPath.section][indexPath.row];
    cell.textLabel.text = dic[@"title"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *clssStr = self.titleArr[indexPath.section][indexPath.row];
    Class c = NSClassFromString(clssStr[@"clsName"]);
    UIViewController *vc = [[c alloc] init];
    NSDictionary *dic = self.titleArr[indexPath.section][indexPath.row];
    vc.title = dic[@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
