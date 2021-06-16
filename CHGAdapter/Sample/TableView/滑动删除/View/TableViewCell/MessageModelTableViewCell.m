//
//  MessageModelTableViewCell.m
//  CHGAdapter
//
//  Created by dnaer5 on 2021/6/16.
//  Copyright © 2021 chen haiGang. All rights reserved.
//

#import "MessageModelTableViewCell.h"
#import "MessageModel.h"
@implementation MessageModelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cellWillAppear {
    [super cellWillAppear];
    MessageModel * message = self.model;
    self.textLabel.text = message.title;
    
}

@end
