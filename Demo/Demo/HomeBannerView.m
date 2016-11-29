//
//  HomeBannerView.m
//  Demo
//
//  Created by zhangqi on 2016/11/28.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "HomeBannerView.h"

@interface HomeBannerView ()
@property (nonatomic, strong) CustomButton *btn1;
@property (nonatomic, strong) CustomButton *btn2;
@property (nonatomic, strong) CustomButton *btn3;
@property (nonatomic, strong) CustomButton *btn4;
@end
@implementation HomeBannerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xffffff);
        [self createView];
    }
    return self;
}

- (void)createView {
    self.btn1 = [CustomButton buttonWithType:UIButtonTypeCustom];
    self.btn1.frame = CGRectMake(0, 0, Screen_Width / 4, self.frame.size.height);
    self.btn1.imageRect = CGRectMake(self.btn1.frame.size.width / 2 - 40 / 2, 0, 40, 40);
    self.btn1.titleRect = CGRectMake(0, 55, self.btn1.frame.size.width, 20);
    self.btn1.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.btn1.imageView.contentMode = UIViewContentModeCenter;
    [self.btn1 setTitle:@"电影" forState:UIControlStateNormal];
    [self.btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn1 setImage:[UIImage imageNamed:@"icon_tabbar_home_active"] forState:UIControlStateNormal];
    [self addSubview:self.btn1];
    
}

@end
