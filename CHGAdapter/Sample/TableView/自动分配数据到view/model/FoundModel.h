//
//  FoundModel.h
//  CHGAdapter
//
//  Created by dnaer5 on 2020/5/12.
//  Copyright © 2020 chen haiGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHGAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

///描述
@property (nonatomic, copy) NSString *name;
///描述
@property (nonatomic, copy) NSString *age;
///描述
@property (nonatomic, copy) NSString *headUrl;

+(instancetype)initWithName:(NSString*)name age:(NSString*)age headUrl:(NSString*)headUrl;

@end

@interface Interaction : NSObject

///描述
@property (nonatomic, copy) NSString *love;
///描述
@property (nonatomic, copy) NSString *share;
///描述
@property (nonatomic, copy) NSString *collect;

+(instancetype)initWithLove:(NSString*)love share:(NSString*)share collect:(NSString*)collect;

@end

@interface FoundModel : NSObject<CHGTableViewCellModelProtocol>

///用户
@property (nonatomic, strong) User *user;
///用户
@property (nonatomic, strong) Interaction *interaction;

+(instancetype)initWithUser:(User*)user interaction:(Interaction*)interaction;

@end

NS_ASSUME_NONNULL_END
