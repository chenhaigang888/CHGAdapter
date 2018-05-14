//
//  CHGTableViewHeaderFooterView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGTableViewHeaderFooterView.h"

@implementation CHGTableViewHeaderFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)headerFooterForSection:(NSInteger)section inTableView:(UITableView*)tableView withData:(id)data type:(CHGTableViewHeaderFooterViewType)type {
    self.section = section;
    self.tableView = tableView;
    self.headerFooterData = data;
    self.type = type;
}

@end
