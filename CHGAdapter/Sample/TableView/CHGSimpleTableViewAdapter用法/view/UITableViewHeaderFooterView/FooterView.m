//
//  FooterView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/28.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "FooterView.h"
#import "FooterModel.h"

@implementation FooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)headerFooterForSection:(NSInteger)section inTableView:(UITableView *)tableView withData:(id)data type:(CHGTableViewHeaderFooterViewType)type {
    [super headerFooterForSection:section inTableView:tableView withData:data type:type];
    FooterModel * model = data;
    self.label.text = model.footerTitle;
}

@end
