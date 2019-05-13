//
//  TableViewCellDataSource.m
//  FacilityTableView
//
//  Created by 廖湘鹏 on 2019/5/7.
//  Copyright © 2019 lxp. All rights reserved.
//

#import "TableViewCellDataSource.h"
#import "NoMoreDataCell.h"
#import "NoMoreDataView.h"

@interface TableViewCellDataSource()

@property(nonatomic,strong)NSArray *items;
@property(nonatomic,copy)NSString *cellIdentifier;
@property(nonatomic,copy)TableViewCellConfigureBlock configureCellBlock;

@end

static NSInteger const _KHEIGHTFOOTVIEW = 44;

@implementation TableViewCellDataSource

- (id)initWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier configureCellBlock:(TableViewCellConfigureBlock)configureBlock {
    
    self = [super init];
    if (self) {
        
        self.items = items;
        self.cellIdentifier = cellIdentifier;
        self.configureCellBlock = configureBlock;
    }
    
    return self;
}

#pragma mark ---tableView代理方法---
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    /*
     判断是否需要显示提示视图
     tableViewStyle为Plainc才需要多创建一个Cell
     第一次请求数据没数据时显示无数据占位图，于是不显示数据到底视图
     */
    if (self.showNoMoreDataView && tableView.style == UITableViewStylePlain && self.items.count != 0) {
        
        return self.items.count + 1;
    }
    
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.items.count == 0) {
        
        return nil;
    }
    
    //提示cell创建逻辑
    if (self.showNoMoreDataView && tableView.style == UITableViewStylePlain && self.items.count == indexPath.row) {
        
        static NSString *identify = @"NOMOREDATACELL";
        NoMoreDataCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (cell==nil) {
            cell=[[NoMoreDataCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        }
        return cell;
        
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    id item = self.items[indexPath.row];
    //将cell和索引传回进行赋值操作
    self.configureCellBlock(cell, item);
    return cell;
}

//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //当tableViewStyle为Plain的时候要显示无更多数据的时候会多创建一个Cell
    if (indexPath.row == self.items.count && self.items.count != 0) {
        
        return _KHEIGHTFOOTVIEW;
    }
    return self.cellHeight;
}

//组的头视图，返回self.headVie
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return self.headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return self.headViewHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    /*
     判断是否需要显示提示视图
     tableViewStyle为Plainc才需要多创建一个Cell
     第一次请求数据没数据时显示无数据占位图，不显示数据到底视图
     */
    if (tableView.style == UITableViewStyleGrouped && self.showNoMoreDataView== YES && self.items.count != 0) {
        
        NoMoreDataView *footView = [[NoMoreDataView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , _KHEIGHTFOOTVIEW)];
        return footView;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (tableView.style == UITableViewStyleGrouped && self.showNoMoreDataView== YES && self.items.count != 0) {
        
        return _KHEIGHTFOOTVIEW;
    }
    
    return 0.0001;
}


@end
