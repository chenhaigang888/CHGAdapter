//
//  FooterModel.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/28.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHGSimpleTableViewAdapter.h"

@interface FooterModel : NSObject<CHGTableViewHeaderFooterModelProtocol>

@property(nonatomic,copy) NSString * footerTitle;

-(instancetype)initWithFooterTitle:(NSString*)footerTitle;

@end
