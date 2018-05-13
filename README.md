# CHGAdapter
主要解决UITableView 在每个controller中都需要设置dataSource和delegate的烦恼，并UITableViewCell与DataSource tableView界耦合



Installation with CocoaPods

pod 'CHGAdapter', '~> 0.1.0'


Usage


- (void)viewDidLoad {
    [super viewDidLoad];
    self.adapter.adapterData = self.adapterData;
    self.tableView.tableViewAdapter = self.adapter;
    [self.tableView setEmptyDataShowWithTitle:@"暂无数据" image:@"icon_dl_xsmm"];
    __weak typeof(self) weakSelf = self;
    //cell、HeadView、FooterView中的button 点击、UITextField输入都通过此block回调
    self.tableView.eventTransmissionBlock = ^id(id target, id params, NSInteger tag, CHGCallBack callBack) {
        NSLog(@"target:%@",[target class]);
        NSLog(@"params:%@",params);
        NSLog(@"tag:%li",tag);
        callBack(@"哈哈");
        return nil;
    };
    
    //cell点击
    self.tableView.tableViewDidSelectRowBlock = ^(UITableView *tableView, NSIndexPath *indexPath, id itemData) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        Test2ViewController * test2VC = [Test2ViewController new];
        [strongSelf.navigationController pushViewController:test2VC animated:YES];
    };
}

-(CHGTableViewAdapter*)adapter{
    if (!_adapter) {
        _adapter = [CHGTableViewAdapter new];
        _adapter.cellName = @"SimpleTableViewCell";
        _adapter.headerName = @"SampleTableViewHeaderFooterView";
        _adapter.footerName = @"SampleTableViewHeaderFooterView";
        _adapter.cellHeight = -1;
        _adapter.headerHeight = 100;
        _adapter.footerHeight = 44;
//        _adapter.rowsOfSectionKeyName = @"test";
    }
    return _adapter;
}

-(CHGTableViewAdapterData*) adapterData {
    if (!_adapterData) {
        _adapterData = [CHGTableViewAdapterData new];
    }
    _adapterData.cellDatas =
//    @[
//      @{@"test":@[@"1",@"2",@"3",@"4",@"5"]},
//      @{@"test":@[@"1",@"2",@"3",@"4",@"5"]}
//    ];
    @[@[@"1",@"2",@"3",@"4",@"5",@"6"],@[@"1",@"2",@"3",@"4",@"5",@"6"]];
    _adapterData.headerDatas = @[@"aaa"];
    _adapterData.footerDatas = @[@"bbb1",@"bbb"];
    return _adapterData;
}
