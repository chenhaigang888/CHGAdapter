//
//  OneTextFieldHeaderFooterView.m
//  demo
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "OneTextFieldHeaderFooterView.h"

@implementation OneTextFieldHeaderFooterView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.textField addTarget:self action:@selector(textFieldInpu:) forControlEvents:UIControlEventEditingChanged];
}

-(void)headerFooterForSection:(NSInteger)section inTableView:(UITableView *)tableView withData:(id)data type:(CHGTableViewHeaderFooterViewType)type {
    [super headerFooterForSection:section inTableView:tableView withData:data type:type];
    self.textField.text = data;
}

-(void)textFieldInpu:(id)sender {
//    构造传输到controller中的数据，此数据可以根据具体情况自定义， 当前demo暂时传输以下内容
    NSDictionary * dic = @{
                           @"inputText":self.textField.text, //告诉controller当前输入的内容
                           @"section":@(self.section),       //告诉controller当前事件传输的section
                           @"type":@(self.type)              //告诉外面当前view属于header还是footer
                           };
    
    //通过eventTransmissionBlock将输入数据传到controller中
    self.eventTransmissionBlock(self, dic, 1, ^id(id data) {
        //如果此数据传输完毕后还要接收controller中穿过来的数据可以在此block中处理
        return nil;
    });
}

@end
