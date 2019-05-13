//
//  ViewController.m
//  FacilityTableView
//
//  Created by 廖湘鹏 on 2019/5/7.
//  Copyright © 2019 lxp. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCellDataSource.h"

#define KWIDTH  [UIScreen mainScreen].bounds.size.width
#define KHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)TableViewCellDataSource *dataSource;
@property(nonatomic,strong)NSMutableArray *data;
@property(nonatomic,strong)UIView *headView;

@end

static NSString *IDENTIFIER = @"identifier";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self getData];
}


- (void)setupUI {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, KHEIGHT) style:self.tableViewStyle];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:IDENTIFIER];
    [self.view addSubview:_tableView];
    
    TableViewCellConfigureBlock configureBlock = ^(UITableViewCell *cell,NSDictionary *item){
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@:%@",item[@"id"],item[@"content"]];
    };
    //创建协议方法处理类
    _dataSource = [[TableViewCellDataSource alloc] initWithItems:self.data cellIdentifier:IDENTIFIER configureCellBlock:configureBlock];
    
    //将协议类设为tableView的代理
    _tableView.delegate = _dataSource;
    _tableView.dataSource = _dataSource;
    
    /*
     设置tableView相关属性，比如头视图，单元格高度
     在需要显示上拉加载无更多数据提示的时候设置 showNoMoreDataView为YES
     */
    
    _dataSource.cellHeight = 50;
    _dataSource.showNoMoreDataView = YES;
    
    
    /*
     不设置则不显示头视图,这里展示两种Style的组的头视图和尾部视图的悬停区别
     所以两种style的上拉加载无数据提醒设置也是不一样的
     */
    _dataSource.headView = self.headView;
    _dataSource.headViewHeight = 100;
    
    
    
    /*
     整个TableView创建下来几行代码，ViewController代码没那么多了
     一句代码设置尾部加载视图，适合Plain和Group
     */
}

//模拟数据
- (void)getData {
    
    for (int i=0; i<15; i++) {
        
        NSDictionary *dataDic = @{
                                  @"id":@"测试",
                                  @"content":[NSString stringWithFormat:@"%d",arc4random()%10]
                                  };
        [self.data addObject:dataDic];
    }
    [_tableView reloadData];
}


- (NSMutableArray *)data {
    
    if (!_data) {
        
        _data = [[NSMutableArray alloc] init];
    }
    return _data;
}

- (UIView *)headView {
    
    if (!_headView) {
        
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, 100)];
        _headView.backgroundColor = [UIColor redColor];
    }
    
    return _headView;
}

@end
