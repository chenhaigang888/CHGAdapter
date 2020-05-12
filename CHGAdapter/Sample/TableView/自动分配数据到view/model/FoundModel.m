//
//  FoundModel.m
//  CHGAdapter
//
//  Created by dnaer5 on 2020/5/12.
//  Copyright © 2020 chen haiGang. All rights reserved.
//

#import "FoundModel.h"

@implementation User

+(instancetype)initWithName:(NSString*)name age:(NSString*)age headUrl:(NSString*)headUrl {
    User * model = [User new];
    model.name = name;
    model.age = age;
    model.headUrl = headUrl;
    return model;
}

@end

@implementation Interaction

+(instancetype)initWithLove:(NSString *)love share:(NSString *)share collect:(NSString *)collect {
    Interaction * model = [Interaction new];
    model.love = love;
    model.share = share;
    model.collect = collect;
    return model;
}

@end

@implementation FoundModel

+(instancetype)initWithUser:(User*)user interaction:(Interaction*)interaction {
    FoundModel * model = [FoundModel new];
    model.user = user;
    model.interaction = interaction;
    return model;
}

- (NSString *)cellClassNameInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return @"FoundTableViewCell";
}

- (CGFloat)cellHeighInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return 180;
}



@end
