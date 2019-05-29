//
//  Style1TableViewCell.m
//  demo
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "Style1TableViewCell.h"

@implementation Style1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.textField addTarget:self action:@selector(textFieldInput:) forControlEvents:UIControlEventEditingChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

//-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView withData:(id)data {
//    [super cellForRowAtIndexPath:indexPath tableView:tableView withData:data];
//}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView withData:(id)data {
    [super cellForRowAtIndexPath:indexPath targetView:targetView withData:data];
}

-(IBAction)btnTap:(id)sender {
    self.eventTransmissionBlock(self, self.model, 1, ^id(id data) {
        return nil;
    });
}

-(void)textFieldInput:(id)sender {
    NSDictionary * dic = @{@"inputText":self.textField.text,@"indexPath":self.indexPath};
    self.eventTransmissionBlock(self, dic, 2, nil);
}

@end
