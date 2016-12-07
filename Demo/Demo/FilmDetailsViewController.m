//
//  FilmDetailsViewController.m
//  Demo
//
//  Created by zhangqi on 2016/11/29.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "FilmDetailsViewController.h"
#import "FilmDetailsDescribeCell.h"
#import "FileCommentCell.h"
#import "FilmCommentModel.h"
static NSString *const Cell_FilmDetailsTemp = @"Cell_FilmDetailsTemp";
static NSString *const Cell_FilmDetails = @"Cell_FilmDetails";
static NSString *const Cell_FilmDetailsDescribe = @"Cell_FilmDetailsDescribe";
static NSString *const Cell_FileComment = @"Cell_FileComment";

@interface FilmDetailsViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    BOOL _isUnfold; // 是否展开电影描述文本
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *viewHeader;
@property (nonatomic, strong) UIImageView *imgVBgHeader;
@property (nonatomic, strong) UIImageView *imgVHeader;
@property (nonatomic, strong) UILabel *labTitle;
@property (nonatomic, strong) NSMutableArray *arrComment;
@property (nonatomic, copy) NSString *strDetails;
@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;//缓存高度
@property (nonatomic, strong) UIView *viewSectionComment;
@end

@implementation FilmDetailsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    // 要求navi左边的按钮和右边的按钮距离左右两边的间距都为10
    UIBarButtonItem *itemShare = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector(handleItemShare)];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    negativeSpacer.width = -10;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, itemShare];
    _isUnfold = NO;
    self.arrComment = [NSMutableArray array];
    [self createView];
    [self loadData];
}

- (void)loadData {
    self.strDetails = @"发发看吧打开了方便vadfkvskb十分恐怖点开放你的身份卡分布看对方vsa发，是的发布sdkfgndfg.f儿科；个呢不能代表快递放假vakjg而监控报告brfs.fas.fs.dbfdm方面、nf.sfnsdfdsnf.nblfdknls/anfmlanmgerngregkreiqrewgnergkna.dnkfn附魔师大幅康师傅阿萨分开收付款时可能付款啦可简单那拉克那付款广大法官。阿尔高发布啊；感受到的， 都是发的神马， 方式，安抚啊，算法阿萨，地方，水电费阿萨，发啊，发，是的发，爱的发，啊发， 发， 发，安抚啊，发开办费看看法律纽芬兰法拉利呢";
    [AFNetworkTool getUrl:FILMCOMMENT_URL body:nil response:ZHResponseStyleJSON requestheadFile:nil isCache:NO success:^(NSURLSessionDataTask *task, id jsonDict) {
        NSArray *arr = jsonDict[@"data"];
        for (NSDictionary *dic in arr) {
            FilmCommentModel *model = [[FilmCommentModel alloc] initWithDic:dic];
            [self.arrComment addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)createView {
    self.viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 300)];
    self.imgVBgHeader = [[UIImageView alloc] init];
    self.imgVBgHeader.backgroundColor = [UIColor brownColor];
    [self.viewHeader addSubview:self.imgVBgHeader];
    [self.imgVBgHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    self.imgVHeader = [[UIImageView alloc] init];
    self.imgVHeader.backgroundColor = [UIColor redColor];
//    self.imgVHeader.image = [UIImage imageNamed:@""];
    [self.viewHeader addSubview:self.imgVHeader];
    [self.imgVHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_offset(10);
        make.width.mas_equalTo(Screen_Width / 3);
        make.height.mas_equalTo(Screen_Width / 3 * 4 / 3);
    }];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[FilmDetailsDescribeCell class] forCellReuseIdentifier:Cell_FilmDetailsDescribe];
    [self.tableView registerClass:[FileCommentCell class] forCellReuseIdentifier:Cell_FileComment];

    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.layoutMargins = UIEdgeInsetsMake(0, 10, 0, 0);
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    self.tableView.tableHeaderView = self.viewHeader;

}

#pragma mark - talbeView delefate 方法
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        FilmDetailsDescribeCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell_FilmDetailsDescribe];
        cell.labTitle.text = self.strDetails;
        cell.clickBtnUnfold = ^() {
            NSLog(@"点击了展开按钮");
            _isUnfold = !_isUnfold;
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade]; // 这个动画比较好用

        };
        return cell;
    } else {
        FileCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell_FileComment];
        cell.model = self.arrComment[indexPath.row];
        return cell;

    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (_isUnfold) {
            return 60 + [self.strDetails backResultStrWithSize:CGSizeMake(Screen_Width - 40, 0) dic:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}];;
        } else {
            return 160;
        }
    }
    FilmCommentModel *model = [self.arrComment objectAtIndex:indexPath.row];
    return [model.content backResultStrWithSize:CGSizeMake(Screen_Width - 40, 0) dic:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}];
}



//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.row == 0) {
//        if (_isUnfold) {
//            [self.heightAtIndexPath setObject:@500 forKey:indexPath];
//        } else {
//            [self.heightAtIndexPath setObject:@160 forKey:indexPath];
//        }
//    } else {
//        NSNumber *height = @(cell.frame.size.height);
//        [self.heightAtIndexPath setObject:height forKey:indexPath];
//    }
//
//
//}
//
//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSNumber *height = [self.heightAtIndexPath objectForKey:indexPath];
//    if(height) {
//        return height.floatValue;
//    } else {
//        return 100;
//    }
//}
//
//
//#pragma mark - Getters
//- (NSMutableDictionary *)heightAtIndexPath
//{
//    if (!_heightAtIndexPath) {
//        _heightAtIndexPath = [NSMutableDictionary dictionary];
//    }
//    return _heightAtIndexPath;
//}



- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 50;
    }
    return HEADER_CELL_HEIGHT;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return FOOTER_CELL_HEIGHT;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return self.arrComment.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        self.viewSectionComment = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 50)];
        self.viewSectionComment.backgroundColor = [UIColor cyanColor];
        return _viewSectionComment;
    }
    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float y = scrollView.contentOffset.y;
    if (y <= 0) {
        [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.alpha = 1;
        // 拉伸后图片的高度
        CGFloat totalOffset = 300 - y;
        // 图片放大比例
        CGFloat scale = totalOffset / 300;
        // 拉伸后图片位置
        self.imgVBgHeader.frame = CGRectMake(-(Screen_Width * scale - Screen_Width) / 2, y, Screen_Width * scale, totalOffset);
    } else if (y <= 120) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor cyanColor] size:CGSizeMake(Screen_Width, 64)] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.alpha = y / 120;
    } else {
        self.navigationController.navigationBar.alpha = 1;

    }
}

- (void)handleItemShare {
    NSLog(@"点击了分享");
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
