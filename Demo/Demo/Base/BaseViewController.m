//
//  BaseViewController.m
//  Demo
//
//  Created by 张琦 on 2016/11/20.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseButton.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromRGB(0xffffff);
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if ([ROOT_MANAGER rootNaviViewControllers].count > 1) {
        BaseButton *btn = [BaseButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"icon_back"]  forState:UIControlStateNormal];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 60, 40);
        [btn setButtonImageTitleStyle:ButtonImageTitleStyleLeft padding:5];
        [btn addTarget:self action:@selector(handleBtn) forControlEvents:UIControlEventTouchUpInside];

        // 解决leftBarButtonItem 偏移的问题
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -10;
        self.navigationItem.leftBarButtonItems = @[negativeSpacer, item];
//        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
        
    }
    // set barButtonItem color
    NSDictionary *barButtonAppearanceDict = @{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:15], NSForegroundColorAttributeName:[UIColor redColor]};

    [[UIBarButtonItem appearance] setTitleTextAttributes:barButtonAppearanceDict forState:UIControlStateNormal];
}
- (void)handleBtn {
    [ROOT_MANAGER popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
