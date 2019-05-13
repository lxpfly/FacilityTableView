//
//  TableViewCellDataSource.h
//  FacilityTableView
//
//  Created by 廖湘鹏 on 2019/5/7.
//  Copyright © 2019 lxp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell,id item);

@interface TableViewCellDataSource : NSObject<UITableViewDelegate,UITableViewDataSource>

//cell的高度
@property(nonatomic,assign)NSInteger cellHeight;

//头视图
@property(nonatomic,strong)UIView *headView;

//组的头视图的高度
@property(nonatomic,assign)CGFloat headViewHeight;

//上拉加载是否显示已经到底了提示视图
@property(nonatomic,assign)BOOL showNoMoreDataView;

/*
 创建方式
 items:数据源
 cellIdentifier:cell注册标识
 configureCellBlock:用于回调创建好的cell
 */
- (id)initWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier configureCellBlock:(TableViewCellConfigureBlock)configureBlock;

@end

