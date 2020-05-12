//
//  InteractionView.m
//  CHGAdapter
//
//  Created by dnaer5 on 2020/5/12.
//  Copyright © 2020 chen haiGang. All rights reserved.
//

#import "InteractionView.h"
#import "Masonry.h"
#import "FoundModel.h"

@interface InteractionView()

@property(nonatomic, strong) UILabel * name;

@end

@implementation InteractionView

- (UILabel *)name {
    if (!_name) {
        _name = [UILabel new];
        _name.backgroundColor = UIColor.greenColor;
    }
    return _name;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
        [self layoutView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self createView];
        [self layoutView];
    }
    return self;
}

-(void)createView {
    self.backgroundColor = UIColor.redColor;
    
    [self addSubview:self.name];
    
}

-(void)layoutView {
    
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    
}

- (void)cellWillAppear {
    [super cellWillAppear];
    Interaction *interaction = self.model;
    self.name.text = [NSString stringWithFormat:@"%@ %@ %@",interaction.love,interaction.share,interaction.collect];
    
}
@end
