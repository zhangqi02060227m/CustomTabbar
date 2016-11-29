//
//  FilmDetailsViewController.m
//  Demo
//
//  Created by zhangqi on 2016/11/29.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "FilmDetailsViewController.h"

static NSString *const Cell_FilmDetailsTemp = @"Cell_FilmDetailsTemp";
static NSString *const Cell_FilmDetails = @"Cell_FilmDetails";

@interface FilmDetailsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *viewHeader;
@property (nonatomic, strong) UIImageView *imgVBgHeader;
@property (nonatomic, strong) UIImageView *imgVHeader;
@property (nonatomic, strong) UILabel *labTitle;
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
    negativeSpacer.width = -10;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, itemShare];
    [self createView];
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
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height - 49) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Cell_FilmDetailsTemp];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.layoutMargins = UIEdgeInsetsMake(0, 10, 0, 0);
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    
    self.tableView.tableHeaderView = self.viewHeader;
}

#pragma mark - talbeView delefate 方法
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell_FilmDetailsTemp];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.layoutMargins = UIEdgeInsetsMake(0, 10, 0, 0);
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return DEFAULT_CELL_HEIGHT;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return HEADER_CELL_HEIGHT;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return FOOTER_CELL_HEIGHT;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
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
