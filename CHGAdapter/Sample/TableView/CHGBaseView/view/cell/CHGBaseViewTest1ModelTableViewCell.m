//
//  CHGBaseViewTest1ModelTableViewCell.m
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/25.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "CHGBaseViewTest1ModelTableViewCell.h"

@implementation CHGBaseViewTest1ModelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.viewLifeCycleProtocols addObject:self.baseView1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView withData:(id)data {
    [super cellForRowAtIndexPath:indexPath targetView:targetView withData:data];
}

@end
