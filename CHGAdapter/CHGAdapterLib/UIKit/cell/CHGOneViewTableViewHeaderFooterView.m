//
//  CHGOneViewTableViewHeaderFooterView.m
//  CHGAdapter
//
//  Created by 陈 海刚 on 2019/3/10.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "CHGOneViewTableViewHeaderFooterView.h"

@implementation CHGOneViewTableViewHeaderFooterView

- (void)headerFooterForSection:(NSInteger)section inTableView:(UITableView *)tableView withData:(id)data type:(CHGTableViewHeaderFooterViewType)type {
    [super headerFooterForSection:section inTableView:tableView withData:data type:type];
    UIView * view = data;
    [self.contentView addSubview:view];
//    view.frame = self.contentView.frame;
//    view.backgroundColor = UIColor.greenColor;
//    self.contentView.backgroundColor = UIColor.yellowColor;
}
@end
