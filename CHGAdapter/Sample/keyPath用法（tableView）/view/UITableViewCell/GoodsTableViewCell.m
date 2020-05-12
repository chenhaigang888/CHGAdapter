//
//  GoodsTableViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "GoodsTableViewCell.h"
#import "GoodsCategoryModel.h"

@implementation GoodsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView model:(id)model {
//    [super cellForRowAtIndexPath:indexPath tableView:tableView withData:data];
//    GoodsModel * model = data;
//    self.title.text = model.name;
//}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView model:(id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    [super cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
    GoodsModel * dataModel = model;
    self.title.text = dataModel.name;
}

@end
