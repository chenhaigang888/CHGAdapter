//
//  SimpleAdapterViewController.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/28.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "SimpleAdapterViewController.h"
#import "AddressNoSelectModel.h"
#import "HeaderModel.h"
#import "FooterModel.h"
#import "CHGAdapter.h"

@interface SimpleAdapterViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SimpleAdapterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.cellDatas = @[
                                 [[AddressNoSelectModel alloc] initWithStatus:0],
                                 [[AddressNoSelectModel alloc] initWithStatus:1],
                                 [[AddressNoSelectModel alloc] initWithStatus:1]
                                 ];
    self.tableView.headerDatas = @[
                                   [[HeaderModel alloc] initWithHeaderTitle:@"没有选择地址的Header"],
                                   [[HeaderModel alloc] initWithHeaderTitle:@"已经选择地址的Header"]
                                   ];
    self.tableView.footerDatas = @[
                                   [[FooterModel alloc] initWithFooterTitle:@"没有选择地址的Footer"],
                                   [[FooterModel alloc] initWithFooterTitle:@"已经选择地址的Footer"]
                                   ];
    
    //cell 被点击
    self.tableView.tableViewDidSelectRowBlock = ^(UITableView *tableView, NSIndexPath *indexPath, id itemData) {
        
    };
    
    // cell header footer 的按钮、输入框等返回的事件
    self.tableView.eventTransmissionBlock = ^id(id target, id params, NSInteger tag, CHGCallBack callBack) {
        
        return nil;
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
