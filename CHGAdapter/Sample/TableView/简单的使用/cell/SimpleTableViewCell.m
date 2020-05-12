//
//  SimpleTableViewCell.m
//  demo
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "SimpleTableViewCell.h"

@implementation SimpleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

//-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView model:(id)model {
//    [super cellForRowAtIndexPath:indexPath tableView:tableView withData:data];
//    self.title.text = data;
//}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView model:(id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    [super cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
    self.title.text = model;
}

@end
