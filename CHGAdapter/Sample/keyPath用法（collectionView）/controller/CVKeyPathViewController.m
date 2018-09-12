//
//  CVKeyPathViewController.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CVKeyPathViewController.h"
#import "GoodsCategoryModel.h"
#import "CountryModel.h"

@interface CVKeyPathViewController ()

@property (nonatomic,weak) IBOutlet UICollectionView *collectionView;

@end

@implementation CVKeyPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * goods = @[[GoodsModel initWithName:@"汉堡" price:@20],
                        [GoodsModel initWithName:@"炸鸡" price:@20],
                        [GoodsModel initWithName:@"可乐" price:@20],
                        [GoodsModel initWithName:@"薯条" price:@20]];
    
    NSArray * pcs = @[[GoodsModel initWithName:@"苹果电脑" price:@20],
                      [GoodsModel initWithName:@"联想电脑" price:@20],
                      [GoodsModel initWithName:@"Dell电脑" price:@20],
                      [GoodsModel initWithName:@"惠普电脑" price:@20]];
    
    NSArray * citys = @[
                        [CityModel initWithName:@"北京"],
                        [CityModel initWithName:@"上海"],
                        [CityModel initWithName:@"广州"],
                        [CityModel initWithName:@"深圳"]
                        ];
    
    NSArray * citys1 = @[
                         [CityModel initWithName:@"纽约"],
                         [CityModel initWithName:@"华盛顿"],
                         [CityModel initWithName:@"丹佛"],
                         [CityModel initWithName:@"旧金山"]
                         ];
    
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    layout.itemSize = CGSizeMake(100, 100);
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 30);
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.collectionViewAdapter.keyPathOfSubData = @"goods";
    self.collectionView.cellDatas =
    @[
      [GoodsCategoryModel initWithName:@"食品" goods:goods],
      [GoodsCategoryModel initWithName:@"电脑" goods:pcs],
      [CountryModel initWithName:@"中国" citys:citys],
      [CountryModel initWithName:@"美国" citys:citys1],
      ];
    self.collectionView.headerDatas = self.collectionView.cellDatas;
    self.collectionView.footerDatas = self.collectionView.cellDatas;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
