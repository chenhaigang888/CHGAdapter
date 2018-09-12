//
//  GoodsCategoryHeaderFooterView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "GoodsCategoryHeaderFooterView.h"
#import "GoodsCategoryModel.h"

@implementation GoodsCategoryHeaderFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)headerFooterForSection:(NSInteger)section inTableView:(UITableView *)tableView withData:(id)data type:(CHGTableViewHeaderFooterViewType)type {
    [super headerFooterForSection:section inTableView:tableView withData:data type:type];
    GoodsCategoryModel * model = data;
    self.title.text = model.name;
}

@end
