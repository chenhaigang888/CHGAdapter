//
//  HeaderView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/28.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "HeaderView.h"
#import "HeaderModel.h"

@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)headerFooterForSection:(NSInteger)section inTableView:(UITableView *)tableView model:(id)model type:(CHGAdapterViewType)type eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    [super headerFooterForSection:section inTableView:tableView model:model type:type eventTransmissionBlock:eventTransmissionBlock];;
    HeaderModel * dataModel = model;
    self.label.text = dataModel.headerTitle;
}

@end
