//
//  FileCommentCell.m
//  Demo
//
//  Created by zhangqi on 2016/12/6.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "FileCommentCell.h"
#import "FilmCommentModel.h"
@interface FileCommentCell ()
@property (nonatomic, strong) UILabel *labNick;

@end
@implementation FileCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}


- (void)createView {
    self.labNick = [[UILabel alloc] init];
    [self.contentView addSubview:self.labNick];
    
    self.labComment = [[UILabel alloc] init];
    [self.contentView addSubview:self.labComment];
    self.labComment.numberOfLines = 0;
    [self.labComment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];

}

- (void)setModel:(FilmCommentModel *)model {
    _model = model;
//    self.labNick.text = self.model.nick;
    self.labComment.text = self.model.content;
}
- (void)layoutSubviews {
    [super layoutSubviews];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
