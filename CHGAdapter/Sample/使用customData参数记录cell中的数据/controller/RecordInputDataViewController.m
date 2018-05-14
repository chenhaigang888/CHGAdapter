//
//  RecordInputDataViewController.m
//  demo
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "RecordInputDataViewController.h"
#import "RecordAdapter.h"

@interface RecordInputDataViewController ()

@property(nonatomic,weak) IBOutlet UITableView * tableView;
@property(nonatomic,strong) RecordAdapter * adapter;
@property(nonatomic,strong) CHGTableViewAdapterData * adapterData;

@end

@implementation RecordInputDataViewController

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

-(RecordAdapter*)adapter{
    if (!_adapter) {
        _adapter = [RecordAdapter new];
    }
    return _adapter;
}

-(CHGTableViewAdapterData*) adapterData {
    if (!_adapterData) {
        _adapterData = [CHGTableViewAdapterData new];
    }
    _adapterData.customData = [NSMutableDictionary dictionary];//用于记录用户输入的数据
    _adapterData.cellDatas = @[
                               @[@"1",@"2",@"3",@"4",@"5",@"6"],
                               @[@"1",@"2",@"3",@"4",@"5",@"6"],
                               @[@"1",@"2",@"3",@"4",@"5",@"6"],
                               @[@"1",@"2",@"3",@"4",@"5",@"6"]
                               ];
    return _adapterData;
}

@end
