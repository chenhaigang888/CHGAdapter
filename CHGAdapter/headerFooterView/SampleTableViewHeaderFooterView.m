//
//  SampleTableViewHeaderFooterView.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "SampleTableViewHeaderFooterView.h"

@implementation SampleTableViewHeaderFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)headerFooterForSection:(NSInteger)section inTableView:(UITableView *)tableView withData:(id)data type:(CHGTableViewHeaderFooterViewType)type{
    [super headerFooterForSection:section inTableView:tableView withData:data type:type];
    [self.button setTitle:data forState:UIControlStateNormal];
}

-(IBAction)btnTap:(id)sender {
    self.eventTransmissionBlock(self, self.headerFooterData, 0, ^id(id data) {
        NSLog(@"回调：%@",data);
        return nil;
    });
}

@end
