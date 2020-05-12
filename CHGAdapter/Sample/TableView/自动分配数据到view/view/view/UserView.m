//
//  UserView.m
//  CHGAdapter
//
//  Created by dnaer5 on 2020/5/12.
//  Copyright © 2020 chen haiGang. All rights reserved.
//

#import "UserView.h"
#import "Masonry.h"
#import "FoundModel.h"

@interface UserView()

@property(nonatomic, strong) UIImageView * icon;
@property(nonatomic, strong) UILabel * name;
@property(nonatomic, strong) UILabel * age;

@end

@implementation UserView

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [UIImageView new];
        _icon.backgroundColor = UIColor.redColor;
    }
    return _icon;
}

- (UILabel *)name {
    if (!_name) {
        _name = [UILabel new];
        _name.backgroundColor = UIColor.greenColor;
    }
    return _name;
}

- (UILabel *)age {
    if (!_age) {
        _age = [UILabel new];
        _age.backgroundColor = UIColor.blueColor;
    }
    return _age;
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
    [self addSubview:self.icon];
    [self addSubview:self.name];
    [self addSubview:self.age];
}

-(void)layoutView {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.equalTo(self.icon.mas_height);
    }];
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).offset(5);
        make.right.equalTo(self);
        make.top.equalTo(self.icon);
    }];
    
    [self.age mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).offset(5);
        make.right.equalTo(self);
        make.bottom.equalTo(self.icon);
        make.height.equalTo(self.name);
        make.top.equalTo(self.name.mas_bottom).offset(1);
    }];
}

- (void)cellWillAppear {
    [super cellWillAppear];
    User *user = self.model;
    self.name.text = user.name;
    self.age.text = user.age;
}

@end
