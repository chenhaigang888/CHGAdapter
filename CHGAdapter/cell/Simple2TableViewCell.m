//
//  Simple2TableViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "Simple2TableViewCell.h"

@implementation Simple2TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setUpSubviews {
    self.title = [UILabel new];
    [self addSubview:self.title];
}

-(void)setLayout {
    self.title.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView withData:(id)data {
    [super cellForRowAtIndexPath:indexPath tableView:tableView withData:data];
    self.title.text = [NSString stringWithFormat:@"%@",data];
}

@end
