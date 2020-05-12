//
//  RecordTableViewCell.m
//  demo
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "RecordTableViewCell.h"
#import "RecordAdapter.h"
#import "CHGTableViewAdapter.h"

@implementation RecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self.textField addTarget:self action:@selector(textFieldInput:) forControlEvents:UIControlEventEditingChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

//-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView model:(id)model {
//    [super cellForRowAtIndexPath:indexPath tableView:tableView withData:data];
//    CHGTableViewAdapterData * adapterData = tableView.tableViewAdapter.adapterData;
//    id recordData = adapterData.customData;
//    id content = recordData[indexPath];//为了方便我这里使用indexPath作为key来存储数据。也可以通过其他参数，比如model的id字段
//    self.textField.text = content;
//}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView model:(id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    [super cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
    CHGTableViewAdapterData * adapterData = ((UITableView*)self.targetView).tableViewAdapter.adapterData;
    id recordData = adapterData.customData;
    id content = recordData[indexPath];//为了方便我这里使用indexPath作为key来存储数据。也可以通过其他参数，比如model的id字段
    self.textField.text = content;
}

-(void)textFieldInput:(id)sender {
    ((UITableView*)self.targetView).tableViewAdapter.adapterData.customData[self.indexPath] = self.textField.text;
}

@end
