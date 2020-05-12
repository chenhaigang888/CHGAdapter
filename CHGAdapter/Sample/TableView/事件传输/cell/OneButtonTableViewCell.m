//
//  OneButtonTableViewCell.m
//  demo
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "OneButtonTableViewCell.h"

@implementation OneButtonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView model:(id)model {
//    [super cellForRowAtIndexPath:indexPath tableView:tableView withData:data];
//    [self.btn setTitle:data forState:UIControlStateNormal];
//}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView model:(id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    [super cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
    [self.btn setTitle:model forState:UIControlStateNormal];
}

-(IBAction)btnTap:(id)sender {
    __weak typeof(self) weakSelf = self;
    //通过eventTransmissionBlock将点击事件传到controller中
    self.eventTransmissionBlock(self, self.model, 1, ^id(id data) {
        //点击按钮后从ViewController中传入一个字符串改变当前btn的数据，主要用于展示更新cell的数据
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.btn setTitle:data forState:UIControlStateNormal];
        return nil;
    });
}

@end
