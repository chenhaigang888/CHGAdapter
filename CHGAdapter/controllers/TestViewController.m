//
//  TestViewController.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "TestViewController.h"
#import "CHGTableViewAdapter.h"
#import "TestAdapter.h"
#import "Test2ViewController.h"

@interface TestViewController ()

@property(nonatomic,weak) IBOutlet UITableView * tableView;
@property(nonatomic,strong) TestAdapter * adapter;
@property(nonatomic,strong) CHGTableViewAdapterData * adapterData;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.adapter.adapterData = self.adapterData;
    self.tableView.tableViewAdapter = self.adapter;
    [self.tableView setEmptyDataShowWithTitle:@"暂无数据" image:@"icon_dl_xsmm"];
    __weak typeof(self) weakSelf = self;
    self.tableView.eventTransmissionBlock = ^id(id target, id params, NSInteger tag, CHGCallBack callBack) {
        NSLog(@"target:%@",[target class]);
        NSLog(@"params:%@",params);
        NSLog(@"tag:%li",tag);
        callBack(@"哈哈");
        return nil;
    };
    
    self.tableView.tableViewDidSelectRowBlock = ^(UITableView *tableView, NSIndexPath *indexPath, id itemData) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        Test2ViewController * test2VC = [Test2ViewController new];
        [strongSelf.navigationController pushViewController:test2VC animated:YES];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
