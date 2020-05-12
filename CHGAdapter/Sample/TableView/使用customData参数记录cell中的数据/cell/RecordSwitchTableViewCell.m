//
//  RecordSwitchTableViewCell.m
//  demo
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "RecordSwitchTableViewCell.h"

@implementation RecordSwitchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self.switch_ addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView model:(id)model {
//    [super cellForRowAtIndexPath:indexPath tableView:tableView withData:data];
//    self.title.text = data;
//    self.switch_.on = [tableView.tableViewAdapter.adapterData.customData[indexPath] boolValue];
//}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView model:(id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    [super cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
    self.title.text = model;
    self.switch_.on = [((UITableView*)targetView).tableViewAdapter.adapterData.customData[indexPath] boolValue];
}

-(void)switchValueChange:(id)sender {
    ((UITableView*)self.targetView).tableViewAdapter.adapterData.customData[self.indexPath] = @(self.switch_.isOn);
}

@end
