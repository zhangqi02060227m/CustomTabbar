//
//  FilmDetailsDescribeCell.m
//  Demo
//
//  Created by zhangqi on 2016/12/5.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "FilmDetailsDescribeCell.h"

@implementation FilmDetailsDescribeCell

// 这个高为160
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}


- (void)createView {
    self.labTitle = [[UILabel alloc] init];
    self.labTitle.numberOfLines = 0;
    [self.contentView addSubview:self.labTitle];
    
    self.btnUnfold = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnUnfold setTitle:@"展开" forState:UIControlStateNormal];
    self.btnUnfold.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.btnUnfold];
    [self.btnUnfold addTarget:self action:@selector(handleBtnUnfold) forControlEvents:UIControlEventTouchUpInside];
}
- (void)handleBtnUnfold {
    self.clickBtnUnfold();

}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize size = [self.labTitle sizeThatFits:CGSizeMake(Screen_Width - 40, 0)];

    [self.labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(20);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20);
        make.top.mas_offset(10);
        if (self.frame.size.height < size.height) {
            make.height.mas_equalTo(100);
        } else {
            make.height.mas_equalTo(size.height);

        }
    }];
    [self.btnUnfold mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.labTitle.mas_left);
        make.right.mas_equalTo(self.labTitle.mas_right);
        make.top.mas_equalTo(self.labTitle.mas_bottom).offset(10);
        make.height.mas_equalTo(40);
    }];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
