//
//  MenuViewController.m
//  demo
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "MenuViewController.h"
#import "CHGTableViewAdapter.h"
#import "ViewController.h"
#import "EventTransmissionViewController.h"
#import "RecordInputDataViewController.h"
#import "CollectionViewViewController.h"
#import "SimpleAdapterViewController.h"
#import "SimpleUseViewController.h"
#import "TVKeyPathViewController.h"

@interface MenuViewController ()

@property(nonatomic,weak) IBOutlet UITableView * tableView;
@property(nonatomic,strong) CHGTableViewAdapter * adapter;
@property(nonatomic,strong) CHGTableViewAdapterData * adapterData;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.adapter.adapterData = self.adapterData;
    self.tableView.tableViewAdapter = self.adapter;
    [self.tableView setEmptyDataShowWithTitle:@"暂无数据" image:@"icon_dl_xsmm"];
    self.tableView.eventTransmissionBlock = ^id(id target, id params, NSInteger tag, CHGCallBack callBack) {
        return nil;
    };
    __weak typeof(self) weakSelf = self;
    self.tableView.tableViewDidSelectRowBlock = ^(UITableView *tableView, NSIndexPath *indexPath, id itemData) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if(indexPath.row == 0){
            ViewController * vc = [ViewController new];
            vc.title = itemData;
            [strongSelf.navigationController pushViewController:vc animated:YES];
        } else if(indexPath.row == 1){
            EventTransmissionViewController * vc = [EventTransmissionViewController new];
            vc.title = itemData;
            [strongSelf.navigationController pushViewController:vc animated:YES];
        } else if(indexPath.row == 2){
            RecordInputDataViewController * vc = [RecordInputDataViewController new];
            vc.title = itemData;
            [strongSelf.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 3) {
            CollectionViewViewController * vc = [CollectionViewViewController new];
            vc.title = itemData;
            [strongSelf.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 4) {
            SimpleAdapterViewController * vc = [SimpleAdapterViewController new];
            vc.title = itemData;
            [strongSelf.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 5) {
            SimpleUseViewController * simpleUseVC = [SimpleUseViewController new];
            [strongSelf.navigationController pushViewController:simpleUseVC animated:YES];
        } else if (indexPath.row == 6) {
            TVKeyPathViewController * vc = [TVKeyPathViewController new];
            [strongSelf.navigationController pushViewController:vc animated:YES];
        }
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(CHGTableViewAdapter*)adapter{
    if (!_adapter) {
        _adapter = [CHGTableViewAdapter new];
        _adapter.cellName = @"TitleTableViewCell";
        _adapter.cellHeight = 44;
        _adapter.headerHeight = 0.001;
        _adapter.footerHeight = 0.001;
    }
    return _adapter;
}

-(CHGTableViewAdapterData*) adapterData {
    if (!_adapterData) {
        _adapterData = [CHGTableViewAdapterData new];
    }
    _adapterData.customData = [NSMutableDictionary dictionary];//用于记录用户输入的数据
    _adapterData.cellDatas = @[
                               @[@"简单的使用",
                                 @"事件传输",
                                 @"使用customData参数记录cell中的数据",
                                 @"collection的adapter用法",
                                 @"SimpleAdapter用法（快速布局）",
                                 @"collectionView最简洁用法",
                                 @"keyPath用法（tableView）"
                                 ]
                               ];
    return _adapterData;
}

@end
