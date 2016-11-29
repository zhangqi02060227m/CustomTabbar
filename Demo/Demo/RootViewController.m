//
//  RootViewController.m
//  Demo
//
//  Created by 张琦 on 2016/11/20.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "RootViewController.h"
#import "HomeMainViewController.h"
#import "TradeMainViewController.h"
#import "FindMainViewController.h"
#import "MineMainViewController.h"

@interface RootViewController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) UINavigationController *curNavi;
@property (nonatomic, strong) NSMutableArray *arrNavi;
@end

@implementation RootViewController



+ (instancetype)shareRootViewController {
    static RootViewController *root = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        root = [[RootViewController alloc] init];
    });
    return root;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.arrNavi = [NSMutableArray array];
    self.delegate = self;
    [self SetupAllControllers];
}


- (void)SetupAllControllers{
    NSArray *titles = @[@"发现", @"关注", @"消息", @"我的"];
    NSArray *images = @[@"icon_tabbar_home~iphone", @"icon_tabbar_subscription~iphone", @"icon_tabbar_notification~iphone", @"icon_tabbar_me~iphone"];
    NSArray *selectedImages = @[@"icon_tabbar_home_active~iphone", @"icon_tabbar_subscription_active~iphone", @"icon_tabbar_notification_active~iphone", @"icon_tabbar_me_active~iphone"];
    
    HomeMainViewController *homeMain = [[HomeMainViewController alloc] init];
    TradeMainViewController *tradeMain = [[TradeMainViewController alloc] init];
    FindMainViewController *findMain = [[FindMainViewController alloc] init];
    MineMainViewController *mineMain = [[MineMainViewController alloc] init];
    
    NSArray *viewControllers = @[homeMain, tradeMain, findMain,  mineMain];
    
    for (int i = 0; i < viewControllers.count; i++) {
        UIViewController *childVc = viewControllers[i];
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:childVc];
        navi.tabBarItem.title = titles[i];
        navi.tabBarItem.image = [[UIImage imageNamed:images[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navi.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self addChildViewController:navi];
        [self.arrNavi addObject:navi];
    }
    self.curNavi = [self.arrNavi firstObject];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:199.0/255.0 green:7.0/255.0 blue:10.0/255.0 alpha:1.0],UITextAttributeTextColor, [UIFont systemFontOfSize:16], UITextAttributeFont,nil] forState:UIControlStateSelected];
    
}



#pragma mark - UITabBarDeledate 方法
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    //    NSLog(@"%@", item.title);
}

#pragma mark - UITabbarControllerDelegate 方法
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    //    NSLog(@"==== %@", tabBarController.viewControllers);
    if ([viewController isEqual:[tabBarController.viewControllers objectAtIndex:3]]) {
        return NO;
    }
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    self.curNavi = self.arrNavi[self.selectedIndex];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.curNavi.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
        [self.curNavi pushViewController:viewController animated:animated];
    }
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated {
    UIViewController *vc = [self.curNavi popViewControllerAnimated:animated];
    return vc;
}
- (nullable NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    return [self.curNavi popToViewController:viewController animated:animated];
}
- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    return [self.curNavi popToRootViewControllerAnimated:animated];
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    [self.curNavi presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    [self.curNavi dismissViewControllerAnimated:flag completion:completion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


