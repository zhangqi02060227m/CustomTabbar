//
//  TradeMainViewController.m
//  Demo
//
//  Created by 张琦 on 2016/11/20.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "TradeMainViewController.h"
#import "Test1ViewController.h"
@interface TradeMainViewController ()

@end

@implementation TradeMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"交易";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 100, 100, 40);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(handleClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)handleClick{
    Test1ViewController *test1 = [[Test1ViewController alloc] init];
    [ROOT_MANAGER pushViewController:test1 animated:YES];

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
