//
//  CityTableViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CityTableViewCell.h"
#import "CountryModel.h"

@implementation CityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView withData:(id)data {
//    [super cellForRowAtIndexPath:indexPath tableView:tableView withData:data];
//    CityModel * model = data;
//    self.title.text = model.name;
//}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView withData:(id)data {
    [super cellForRowAtIndexPath:indexPath targetView:targetView withData:data];
    CityModel * model = data;
    self.title.text = model.name;
}

@end
