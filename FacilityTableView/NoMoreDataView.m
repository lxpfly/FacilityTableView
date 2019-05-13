//
//  NoMoreDataView.m
//  FacilityTableView
//
//  Created by 廖湘鹏 on 2019/5/7.
//  Copyright © 2019 lxp. All rights reserved.
//

#import "NoMoreDataView.h"

@implementation NoMoreDataView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void) initView{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    label.text = @"Group尾部提示：已经到底了";
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
    
}


@end
