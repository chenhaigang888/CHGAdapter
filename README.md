# CHGAdapter
主要解决UITableView 在每个controller中都需要设置dataSource和delegate的烦恼，并UITableViewCell与DataSource tableView界耦合



Installation with CocoaPods

pod 'CHGAdapter', '~> 0.1.0'


Usage

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

@end




SimpleTableViewCell 文件中

#import "SimpleTableViewCell.h"

@implementation SimpleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView withData:(id)data {
    [super cellForRowAtIndexPath:indexPath tableView:tableView withData:data];
    self.backgroundColor = indexPath.row % 2 == 0 ? [UIColor greenColor]:[UIColor redColor];
    self.title.text = [NSString stringWithFormat:@"%@",data];
}

-(IBAction)btnTap:(id)sender {
    self.eventTransmissionBlock(self, self.cellData, 0, ^id(id data) {
        NSLog(@"cell中回调：%@",data);
        self.title.text = [NSString stringWithFormat:@"%@",data];
        return nil;
    });
}

@end



SampleTableViewHeaderFooterView.m 文件

#import "SampleTableViewHeaderFooterView.h"

@implementation SampleTableViewHeaderFooterView

-(void)headerFooterForSection:(NSInteger)section inTableView:(UITableView *)tableView withData:(id)data type:(CHGTableViewHeaderFooterViewType)type{
    [super headerFooterForSection:section inTableView:tableView withData:data type:type];
    [self.button setTitle:data forState:UIControlStateNormal];
}

-(IBAction)btnTap:(id)sender {
    self.eventTransmissionBlock(self, self.headerFooterData, 0, ^id(id data) {
        NSLog(@"回调：%@",data);
        return nil;
    });
}

