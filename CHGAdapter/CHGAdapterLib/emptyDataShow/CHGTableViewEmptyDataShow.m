//
//  CHGTableViewEmptyDataShow.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/11.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGTableViewEmptyDataShow.h"

@implementation CHGTableViewEmptyDataShow


//+(_Nonnull instancetype) sharedInstance {
//    static dispatch_once_t pred;
//    static id baseSingleTon = nil;
//    
//    dispatch_once(&pred, ^{
//        baseSingleTon = [super new];
//    });
//    return baseSingleTon;
//
//}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:_imageName];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSMutableAttributedString * s = [[NSMutableAttributedString alloc] initWithString:_title attributes:nil];
    [s addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, _title.length)];
    return s;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return _emptyDataSetShouldAllowScroll;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return self.verticalOffset;
}

@end
