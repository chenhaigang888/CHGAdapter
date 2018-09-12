//
//  CountryModel.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHGAdapter.h"

@interface CityModel : NSObject<CHGTableViewCellModelProtocol>

@property (nonatomic,strong) NSString *name;

+(instancetype)initWithName:(NSString*)name;

@end

@interface CountryModel : NSObject<CHGTableViewHeaderFooterModelProtocol>

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSArray<CityModel*> * citys;

+(instancetype)initWithName:(NSString*)name citys:(NSArray<CityModel*>*)citys;

@end
