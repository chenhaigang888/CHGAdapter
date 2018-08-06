//
//  AddressNoSelectModel.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/28.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHGAdapter.h"

@interface AddressNoSelectModel : NSObject<CHGTableViewCellModelProtocol>

@property(nonatomic,assign) NSInteger status;//地址的状态0:没有选择地址，1:已经选择地址


-(instancetype)initWithStatus:(NSInteger)status;

@end
