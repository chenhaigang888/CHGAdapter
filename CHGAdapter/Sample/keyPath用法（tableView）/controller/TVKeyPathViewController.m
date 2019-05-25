//
//  TVKeyPathViewController.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "TVKeyPathViewController.h"
#import "CHGAdapter.h"
#import "GoodsCategoryModel.h"
#import "CountryModel.h"

@interface TVKeyPathViewController ()

@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end

@implementation TVKeyPathViewController

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
    
    self.tableView.cellDatas =
    @[
        [GoodsCategoryModel initWithName:@"食品" goods:goods],
        [GoodsCategoryModel initWithName:@"电脑" goods:pcs],
        [CountryModel initWithName:@"中国" citys:citys],
        [CountryModel initWithName:@"美国" citys:citys1],
      ];
    self.tableView.headerDatas = self.tableView.cellDatas;
//    self.tableView.footerDatas = self.tableView.cellDatas;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
