//
//  FoundTableViewCell.m
//  CHGAdapter
//
//  Created by dnaer5 on 2020/5/12.
//  Copyright © 2020 chen haiGang. All rights reserved.
//

#import "FoundTableViewCell.h"
#import "UserView.h"
#import "InteractionView.h"

@interface FoundTableViewCell()
@property (weak, nonatomic) IBOutlet UserView *userView;
@property (weak, nonatomic) IBOutlet InteractionView *interactionView;

@end

@implementation FoundTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self addAutoDistributionModelView:self.userView mapping:@{@(CHGAdapterViewTypeCellType):@"user"}];
    [self addAutoDistributionModelView:self.interactionView mapping:@{@(CHGAdapterViewTypeCellType):@"interaction"}];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}


@end
