//
//  NoMoreDataCell.m
//  FacilityTableView
//
//  Created by 廖湘鹏 on 2019/5/7.
//  Copyright © 2019 lxp. All rights reserved.
//

#import "NoMoreDataCell.h"

static NSInteger _KHeightForCell = 40;

@implementation NoMoreDataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self creatView];
    }
    
    return self;
}

- (void)creatView {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, _KHeightForCell)];
    label.text = @"Plain尾部提示：已经到底了";
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:label];
}

@end
