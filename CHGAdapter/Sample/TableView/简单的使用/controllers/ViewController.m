//
//  ViewController.m
//  demo
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "ViewController.h"
#import "CHGTableViewAdapter.h"

@interface ViewController ()

@property(nonatomic,weak) IBOutlet UITableView * tableView;
@property(nonatomic,strong) CHGTableViewAdapter * adapter;
@property(nonatomic,strong) CHGTableViewAdapterData * adapterData;

@end

@implementation ViewController

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
}

-(CHGTableViewAdapter*)adapter{
    if (!_adapter) {
        _adapter = [CHGTableViewAdapter new];
        _adapter.cellName = @"SimpleTableViewCell";
        _adapter.headerName = @"SampleTableViewHeaderFooterView";
        _adapter.footerName = @"SampleTableViewHeaderFooterView";
        _adapter.cellHeight = -1;
        _adapter.headerHeight = 30;
        _adapter.footerHeight = 44;
    }
    return _adapter;
}

-(CHGTableViewAdapterData*) adapterData {
    if (!_adapterData) {
        _adapterData = [CHGTableViewAdapterData new];
    }
    _adapterData.cellDatas =
  @[
    @[@"1",@"2",@"3",@"4",@"5",@"6"],
    @[@"1",@"2",@"3",@"4",@"5",@"6"],
    @[@"1",@"2",@"3",@"4",@"5",@"6"]
    ];
    _adapterData.headerDatas = @[@"第一个section的Header",@"第二个section的Header"];
    _adapterData.footerDatas = @[@"第一个section的Footer",@"第二个section的Footer"];
    return _adapterData;
}

@end
