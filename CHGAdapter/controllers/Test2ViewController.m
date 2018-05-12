//
//  Test2ViewController.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "Test2ViewController.h"
#import "TestAdapter.h"

@interface Test2ViewController ()

@property(nonatomic,weak) IBOutlet UITableView * tableView;
@property(nonatomic,strong) TestAdapter * adapter;
@property(nonatomic,strong) CHGTableViewAdapterData * adapterData;

@end

@implementation Test2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.adapter.adapterData = self.adapterData;
    self.tableView.tableViewAdapter = self.adapter;
    [self.tableView setEmptyDataShowWithTitle:@"暂无数据" image:@"icon_dl_xsmm"];
    self.tableView.eventTransmissionBlock = ^id(id target, id params, NSInteger tag, CHGCallBack callBack) {
        return nil;
    };
    
    self.tableView.tableViewDidSelectRowBlock = ^(UITableView *tableView, NSIndexPath *indexPath, id itemData) {
        NSLog(@"当前点击section:%li row:%li",indexPath.section,indexPath.row);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CHGTableViewAdapter*)adapter{
    if (!_adapter) {
        _adapter = [TestAdapter new];
        _adapter.cellName = @"SimpleTableViewCell";
        _adapter.headerName = @"SampleTableViewHeaderFooterView";
        _adapter.footerName = @"SampleTableViewHeaderFooterView";
        _adapter.cellHeight = -1;
        _adapter.headerHeight = 100;
        _adapter.footerHeight = 44;
        _adapter.rowsOfSectionKeyName = @"test";
    }
    return _adapter;
}

-(CHGTableViewAdapterData*) adapterData {
    if (!_adapterData) {
        _adapterData = [CHGTableViewAdapterData new];
    }
    _adapterData.cellDatas =
    @[
      @{@"test":@[@"1",@"2",@"3",@"4",@"5"]},
      @{@"test":@[@"1",@"2",@"3",@"4",@"5"]}
      ];
    //    @[@[@"1",@"2",@"3",@"4",@"5",@"6"],@[@"1",@"2",@"3",@"4",@"5",@"6"]];
    _adapterData.headerDatas = @[@"aaa"];
    _adapterData.footerDatas = @[@"bbb1",@"bbb"];
    return _adapterData;
}

@end
