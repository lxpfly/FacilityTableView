//
//  MainViewController.m
//  FacilityTableView
//
//  Created by 廖湘鹏 on 2019/5/10.
//  Copyright © 2019 lxp. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"

#define KWIDTH  [UIScreen mainScreen].bounds.size.width
#define KHEIGHT [UIScreen mainScreen].bounds.size.height

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatBtn];
}

- (void)creatBtn {
    
    UIButton *plainBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    plainBtn.frame = CGRectMake(0, 100, KWIDTH, 50);
    [plainBtn setTitle:@"PlainStyle" forState:UIControlStateNormal];
    plainBtn.tag = 1000;
    [plainBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:plainBtn];
    
    UIButton *groupBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    groupBtn.frame = CGRectMake(0, 150, KWIDTH, 50);
    [groupBtn setTitle:@"GroupStyle" forState:UIControlStateNormal];
    groupBtn.tag = 1001;
    [groupBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:groupBtn];
}

- (void)btnClick:(UIButton *)btn {
    
    ViewController *Vc = [[ViewController alloc] init];
    switch (btn.tag) {
        case 1000:
            
            Vc.tableViewStyle = UITableViewStylePlain;
            Vc.title = @"PlainStyle";
            break;
        case 1001:
            
            Vc.tableViewStyle = UITableViewStyleGrouped;
            Vc.title = @"GroupStyle";
            break;
        default:
            break;
    }
    
    [self.navigationController pushViewController:Vc animated:YES];
}

@end
