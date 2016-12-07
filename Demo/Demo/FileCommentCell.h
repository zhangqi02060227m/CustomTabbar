//
//  FileCommentCell.h
//  Demo
//
//  Created by zhangqi on 2016/12/6.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FilmCommentModel;
@interface FileCommentCell : UITableViewCell
@property (nonatomic, strong) FilmCommentModel *model;
@property (nonatomic, strong) UILabel *labComment;

@end
