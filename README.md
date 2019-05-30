# CHGAdapter 
主要解决UITableView 在每个controller中都需要设置dataSource和delegate的烦恼，并UITableViewCell与DataSource tableView解耦合
具体表现为

- Adapter与UITableView、Adapter与UITableViewCell完全解耦合。
- 只需要在controller中设置好adapter，给adapter需要显示的数据，adapter会把每个cell需要的数据赋予cell。
- UITableViewCell中按钮的点击事件、UITextField的输入事件、UISwitch等等都通过统一的CHGTableViewDidSelectRowBlock进行传输。
- controller少了很多有关UITableViewDelegate以及UITableViewDatasource的相关代码，controller代码更加清晰。
- 基于以上特点adapter、cell、HeaderFooterView都可以最大限度的复用

swift版： https://github.com/chenhaigang888/CHGAdapter_swift

### 如有使用方面的问题或者交流请加QQ群：494648687

### Installation with CocoaPods

> pod 'CHGAdapter', '~> 1.0.0'
- 导入头文件 #import "CHGAdapter.h"

### example 最简单的用法（不使用Adapter）

```
@interface SimpleAdapterViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SimpleAdapterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.cellDatas = @[
                                 [[AddressNoSelectModel alloc] initWithStatus:0],
                                 [[AddressNoSelectModel alloc] initWithStatus:1],
                                 [[AddressNoSelectModel alloc] initWithStatus:1]
                                 ];
    self.tableView.headerDatas = @[
                                   [[HeaderModel alloc] initWithHeaderTitle:@"没有选择地址的Header"],
                                   [[HeaderModel alloc] initWithHeaderTitle:@"已经选择地址的Header"]
                                   ];
    self.tableView.footerDatas = @[
                                   [[FooterModel alloc] initWithFooterTitle:@"没有选择地址的Footer"],
                                   [[FooterModel alloc] initWithFooterTitle:@"已经选择地址的Footer"]
                                   ];
    
    //cell 被点击
    self.tableView.tableViewDidSelectRowBlock = ^(UITableView *tableView, NSIndexPath *indexPath, id itemData) {
        
    };
    
    // cell header footer 的按钮、输入框等返回的事件
    self.tableView.eventTransmissionBlock = ^id(id target, id params, NSInteger tag, CHGCallBack callBack) {
        
        return nil;
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

```

### example  UITableView  (使用Adapter)

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


### example UICollectionView

```
#import "CollectionViewViewController.h"
#import "TestCollectionAdapter.h"
#import "SampleLayout.h"

@interface CollectionViewViewController ()

@property(nonatomic,weak) IBOutlet UICollectionView * collectionView;
@property(nonatomic,strong) TestCollectionAdapter * adapter;
@property(nonatomic,strong) CHGCollectionViewAdapterData * adapterData;

@end

@implementation CollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(100, 100);
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 30);
    layout.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 30);
    self.collectionView.collectionViewLayout = layout;
    self.adapter.adapterData = self.adapterData;
    self.collectionView.collectionViewAdapter = self.adapter;
    [self.collectionView setEmptyDataShowWithTitle:@"没有任何数据" image:@"icon_dl_xsmm"];
    self.collectionView.eventTransmissionBlock = ^id(id target, id params, NSInteger tag, CHGCallBack callBack) {
        NSLog(@"paramsjjj:%@",params);
        return nil;
    };

    self.collectionView.collectionViewDidSelectItemAtIndexPathBlock = ^(UICollectionView *collectionView, NSIndexPath *indexPath, id itemData) {
        NSLog(@"itemData:%@",itemData);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(TestCollectionAdapter*)adapter {
    if (!_adapter) {
        _adapter = [TestCollectionAdapter new];
        _adapter.cellName = @"Sample1CollectionViewCell";
        _adapter.sectionHeaderName = @"SampleHeaderCollectionReusableView";
        _adapter.sectionFooterName = @"SampleHeaderCollectionReusableView";
        _adapter.rowsOfSectionKeyName = @"test";
    }
    return _adapter;
}

-(CHGCollectionViewAdapterData*)adapterData {
    if (!_adapterData) {
        _adapterData = [CHGCollectionViewAdapterData new];
    }
    _adapterData.customData = [NSMutableDictionary dictionary];
    _adapterData.cellDatas =
    @[
      @{@"test":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]},
      @{@"test":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]}
      ];
    _adapterData.headerDatas = @[@"h1",@"h2"];
    _adapterData.footerDatas = @[@"f1",@"f2",@"f3",@"f4"];
    return _adapterData;
}

@end
```

### example  CHGSimpleTableViewAdapter快速布局

- CHGSimpleTableViewAdapter中Cell的数据（Model）必须实现协议CHGTableViewCellModelProtocol并且实现并且实现其方法
- CHGSimpleTableViewAdapter中的HeaderFooter的数据（Model）必须实现协议CHGTableViewHeaderFooterModelProtocol并且实现并且实现其方法

```
具体使用请参考Demo中的SimpleAdapterViewController页面
```

### example  自定义Adapter
CHGTableViewAdapter和CHGCollectionViewAdapter默认实现一种类型的Cell和一种类型的HeaderView以及FooterView，如果你的TableView、CollectionView想显示不通风格的Cell、HeaderView、FooterView；可以通过集成CHGCollectionViewAdapter、CHGCollectionViewAdapter方式扩展。通过扩展实现以下几个方法返回不同类型,以及在Adapter的子类中实现TableView的DataSource、Delegate方法。CollectionView同理

```
/**
 获取cell的类名

 @param data indexPath的数据
 @param tableView tableView对象
 @param indexPath indexPath
 @return 返回indexPath的cell 类名
 */
-(NSString*)obtainCellNameWithCellData:(id)data tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 获取header的类名

 @param data 当前header的数据
 @param tableView tableView对象
 @param section section
 @return 返回section的类名
 */
-(NSString*)obtainHeaderNameWithHeaderData:(id)data tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;

/**
 获取footer的类名
 
 @param data 当前footer的数据
 @param tableView tableView对象
 @param section section
 @return 返回section的类名
 */
-(NSString*)obtainFooterNameWithFooterData:(id)data tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;

```
