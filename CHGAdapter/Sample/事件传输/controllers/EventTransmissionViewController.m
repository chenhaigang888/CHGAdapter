//
//  EventTransmissionViewController.m
//  demo
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "EventTransmissionViewController.h"
#import "CHGTableViewAdapter.h"
#import "OneButtonTableViewCell.h"
#import "OneTextFieldHeaderFooterView.h"

@interface EventTransmissionViewController ()

@property(nonatomic,weak) IBOutlet UITableView * tableView;
@property(nonatomic,strong) CHGTableViewAdapter * adapter;
@property(nonatomic,strong) CHGTableViewAdapterData * adapterData;

@end

@implementation EventTransmissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.adapter.adapterData = self.adapterData;
    self.tableView.tableViewAdapter = self.adapter;
    [self.tableView setEmptyDataShowWithTitle:@"暂无数据" image:@"icon_dl_xsmm"];
    self.tableView.eventTransmissionBlock = ^id(id target, id params, NSInteger tag, CHGCallBack callBack) {
        if([target isKindOfClass:[OneButtonTableViewCell class]]){//是OneButtonTableViewCell中的事件响应，当前只有一个button
            if(tag == 1){//一个cell中有可能有多个事件需要传输，通过tag字段判断
                NSLog(@"当前传输内容：%@",params);
            }
        } else if([target isKindOfClass:[OneTextFieldHeaderFooterView class]]){//是Header或则footerView的事件传输
            if(tag == 1){
                NSString * inputText = params[@"inputText"];
                NSLog(@"当前输入的内容是：%@",inputText);
            }
        }
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
        _adapter = [CHGTableViewAdapter new];
        _adapter.cellName = @"OneButtonTableViewCell";
        _adapter.headerName = @"OneTextFieldHeaderFooterView";
        _adapter.footerName = @"OneTextFieldHeaderFooterView";
        _adapter.cellHeight = -1;
        _adapter.headerHeight = 50;
        _adapter.footerHeight = 44;
    }
    return _adapter;
}

-(CHGTableViewAdapterData*) adapterData {
    if (!_adapterData) {
        _adapterData = [CHGTableViewAdapterData new];
    }
    _adapterData.cellDatas = @[
                               @[@"1",@"2",@"3",@"4",@"5",@"6"],
                               @[@"1",@"2",@"3",@"4",@"5",@"6"]
                               ];
    _adapterData.headerDatas = @[@"第一个section的Header",@"第二个section的Header"];
    _adapterData.footerDatas = @[@"第一个section的Footer",@"第二个section的Footer"];
    return _adapterData;
}


@end
