//
//  SimpleAdapterViewController.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/28.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "SimpleAdapterViewController.h"
#import "CHGSimpleTableViewAdapter.h"
#import "CHGTableViewAdapterData.h"
#import "AddressNoSelectModel.h"
#import "HeaderModel.h"
#import "FooterModel.h"
#import "UITableView+CHGSimpleTableViewAdapter.h"

@interface SimpleAdapterViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) CHGTableViewAdapterData * adapterData;

@end

@implementation SimpleAdapterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.adapterData = self.adapterData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(CHGTableViewAdapterData*) adapterData {
    if (!_adapterData) {
        _adapterData = [CHGTableViewAdapterData new];
        //cell的数据
        _adapterData.cellDatas =
        @[
            [[AddressNoSelectModel alloc] initWithStatus:0],
            [[AddressNoSelectModel alloc] initWithStatus:1],
            [[AddressNoSelectModel alloc] initWithStatus:1]
          ];
        
        //header的数据
        _adapterData.headerDatas =
        @[
            [[HeaderModel alloc] initWithHeaderTitle:@"没有选择地址的Header"],
            [[HeaderModel alloc] initWithHeaderTitle:@"已经选择地址的Header"]
        ];
        
        //footer的数据
        _adapterData.footerDatas =
        @[
            [[FooterModel alloc] initWithFooterTitle:@"没有选择地址的Footer"],
            [[FooterModel alloc] initWithFooterTitle:@"已经选择地址的Footer"]
        ];
    }
    return _adapterData;
}
@end
