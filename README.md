# CHGAdapter
主要解决UITableView 在每个controller中都需要设置dataSource和delegate的烦恼，并UITableViewCell与DataSource tableView解耦合
具体表现为

- Adapter与UITableView、Adapter与UITableViewCell完全解耦合。
- 只需要在controller中设置好adapter，给adapter需要显示的数据，adapter会把每个cell需要的数据赋予cell。
- UITableViewCell中按钮的点击事件、UITextField的输入事件、UISwitch等等都通过统一的CHGTableViewDidSelectRowBlock进行传输。
- controller少了很多有关UITableViewDelegate以及UITableViewDatasource的相关代码，controller代码更加清晰。
- 基于以上特点adapter、cell、HeaderFooterView都可以最大限度的复用

### Installation with CocoaPods


> pod 'CHGAdapter', '~> 0.1.3'

### example

```
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
    _adapterData.cellDatas = @[
                               @[@"1",@"2",@"3",@"4",@"5",@"6"],
                               @[@"1",@"2",@"3",@"4",@"5",@"6"]
                               ];
    _adapterData.headerDatas = @[@"第一个section的Header",@"第二个section的Header"];
    _adapterData.footerDatas = @[@"第一个section的Footer",@"第二个section的Footer"];
    return _adapterData;
}

@end

```
