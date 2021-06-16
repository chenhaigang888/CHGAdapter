//
//  MessageModel.h
//  CHGAdapter
//
//  Created by dnaer5 on 2021/6/16.
//  Copyright © 2021 chen haiGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHGAdapter.h"
NS_ASSUME_NONNULL_BEGIN

@interface MessageModel : NSObject<CHGTableViewCellModelProtocol>

@property(nonatomic,copy) NSString * title;

@end

NS_ASSUME_NONNULL_END
