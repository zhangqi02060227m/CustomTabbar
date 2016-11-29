//
//  RootViewController.h
//  Demo
//
//  Created by 张琦 on 2016/11/20.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ROOT_MANAGER [RootViewController shareRootViewController]

@interface RootViewController : UITabBarController

+ (instancetype)shareRootViewController;
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated;
- (nullable NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated;
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion;
- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion;

@end
