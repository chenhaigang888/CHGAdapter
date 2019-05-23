//
//  Style2TableViewCell.m
//  demo
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "Style2TableViewCell.h"

@implementation Style2TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

//-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView withData:(id)data {
//    [super cellForRowAtIndexPath:indexPath tableView:tableView withData:data];
//    self.title.text = data;
//}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView withData:(id)data {
    [super cellForRowAtIndexPath:indexPath targetView:targetView withData:data];
    self.title.text = data;
}

-(void)switchValueChange:(id)sender {
    self.eventTransmissionBlock(self, @(self.switch_.isOn), 1, nil);
}

@end
