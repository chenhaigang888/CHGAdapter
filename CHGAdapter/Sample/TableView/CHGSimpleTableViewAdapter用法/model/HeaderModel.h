//
//  HeaderModel.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/28.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHGSimpleTableViewAdapter.h"

@interface HeaderModel : NSObject<CHGTableViewHeaderFooterModelProtocol>

@property(nonatomic,copy) NSString * headerTitle;

-(instancetype)initWithHeaderTitle:(NSString*)headerTitle;

@end
