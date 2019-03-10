//
//  CHGOneViewTableViewCell.m
//  CHGAdapter
//
//  Created by 陈 海刚 on 2019/3/10.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "CHGOneViewTableViewCell.h"

@implementation CHGOneViewTableViewCell

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView withData:(id)data {
    [super cellForRowAtIndexPath:indexPath tableView:tableView withData:data];
    UIView * view = data;
    [self.contentView addSubview:view];
}

@end
