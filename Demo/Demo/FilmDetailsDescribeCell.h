//
//  FilmDetailsDescribeCell.h
//  Demo
//
//  Created by zhangqi on 2016/12/5.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilmDetailsDescribeCell : UITableViewCell
@property (nonatomic, strong) UILabel *labTitle;
@property (nonatomic, strong) UIButton *btnUnfold;
@property (nonatomic, copy) void (^clickBtnUnfold)();
@end
