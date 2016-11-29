//
//  HomeMainViewController.m
//  Demo
//
//  Created by 张琦 on 2016/11/20.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "HomeMainViewController.h"
#import "TestViewController.h"
#import "HomeBannerView.h"
#import "Home1ViewController.h"
#import "Home2ViewController.h"
#import "FilmDetailsViewController.h"
@interface HomeMainViewController ()<UIScrollViewDelegate>
@property (nonatomic, copy) NSArray *arrCopy;
@property (nonatomic, strong) NSArray *arrStrong;
@property (nonatomic, strong) HomeBannerView *banner;
@property (nonatomic, strong) UIView *viewTop;
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@property (nonatomic, strong) UIButton *btn3;
@property (nonatomic, strong) UIScrollView *scrollContent;
@property (nonatomic, strong) UIViewController *currentVc;
@end

@implementation HomeMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"aaa";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 100, 100, 40);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(handleClick) forControlEvents:UIControlEventTouchUpInside];
    
        
    

}





- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)handleClick{
//    TestViewController *test = [[TestViewController alloc] init];
//    [ROOT_MANAGER pushViewController:test animated:YES];
    FilmDetailsViewController *film = [[FilmDetailsViewController alloc] init];
    [ROOT_MANAGER pushViewController:film animated:YES];
}



- (void)handleLeftItem {
    NSLog(@"法师打发");
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
