//
//  SimpleUseViewController.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/8/17.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "SimpleUseViewController.h"
#import "CHGAdapter.h"
#import "Test1CellModel.h"
#import "Test2CellModel.h"
#import "Test1ReuseableViewModel.h"
#import "Test2ReuseableViewModel.h"

@interface SimpleUseViewController ()

@property (nonatomic,weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *cellDatas;
@property (nonatomic,strong) NSArray *headerDatas;
@property (nonatomic,strong) NSArray *footerDatas;

@end

@implementation SimpleUseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置layout
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(150, 150);
    layout.minimumLineSpacing = 10;//行最小间隔
    layout.minimumInteritemSpacing = 40;//列最小间隔
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 40);
    layout.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 40);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.cellDatas = self.cellDatas;
    self.collectionView.headerDatas = self.headerDatas;
    self.collectionView.footerDatas = self.footerDatas;
    
}

-(NSArray*)footerDatas {
    if (!_footerDatas) {
        _footerDatas = @[
                         [Test2ReuseableViewModel new],
                         [Test2ReuseableViewModel new],
                         [Test2ReuseableViewModel new],
                         [Test2ReuseableViewModel new]
                        ];
    }
    return _footerDatas;
}

-(NSArray*)headerDatas {
    if (!_headerDatas) {
        _headerDatas = @[
                            [Test1ReuseableViewModel new],
                            [Test1ReuseableViewModel new],
                            [Test1ReuseableViewModel new],
                            [Test1ReuseableViewModel new]
                         ];
    }
    return _headerDatas;
}

-(NSArray *) cellDatas {
    if (!_cellDatas) {
        _cellDatas = @[
                        @[
                            [Test1CellModel new],
                            [Test1CellModel new],
                            [Test1CellModel new],
                            [Test2CellModel new],
                            [Test1CellModel new],
                            [Test1CellModel new]
                        ],
                        @[
                            [Test1CellModel new],
                            [Test1CellModel new],
                            [Test1CellModel new],
                            [Test2CellModel new],
                            [Test1CellModel new],
                            [Test1CellModel new]
                            ],
                        @[
                            [Test1CellModel new],
                            [Test1CellModel new],
                            [Test1CellModel new],
                            [Test2CellModel new],
                            [Test1CellModel new],
                            [Test1CellModel new]
                            ],
                        @[
                            [Test1CellModel new],
                            [Test1CellModel new],
                            [Test1CellModel new],
                            [Test2CellModel new],
                            [Test1CellModel new],
                            [Test1CellModel new]
                            ]
                       ];
    }
    return _cellDatas;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
