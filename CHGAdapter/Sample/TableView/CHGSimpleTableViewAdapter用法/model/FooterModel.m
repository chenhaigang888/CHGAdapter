//
//  FooterModel.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/7/28.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "FooterModel.h"

@implementation FooterModel

-(instancetype)initWithFooterTitle:(NSString*)footerTitle {
    self = [super init];
    if (self) {
        self.footerTitle = footerTitle;
    }
    return self;
}

- (NSString *)getHeaderFooterClass {
    return @"FooterView";
}

- (CGFloat)getHeaderFooterHeigh {
    return 30;
}
@end
