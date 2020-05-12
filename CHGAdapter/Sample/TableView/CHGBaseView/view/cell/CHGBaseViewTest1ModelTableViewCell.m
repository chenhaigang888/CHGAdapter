//
//  CHGBaseViewTest1ModelTableViewCell.m
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/25.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "CHGBaseViewTest1ModelTableViewCell.h"
#import "CHGViewMappingObject.h"

@implementation CHGBaseViewTest1ModelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.protocolsVMO addObject:[CHGViewMappingObject initWithView:self.baseView1 mapping:@{@(CHGAdapterViewTypeCellType):[NSNull new]}]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView model:(id)model eventTransmissionBlock:(nonnull CHGEventTransmissionBlock)eventTransmissionBlock{
    [super cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
}

@end
