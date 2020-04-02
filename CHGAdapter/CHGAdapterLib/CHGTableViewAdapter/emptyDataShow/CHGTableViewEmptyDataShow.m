//
//  CHGTableViewEmptyDataShow.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/11.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGTableViewEmptyDataShow.h"


@implementation CHGTableViewEmptyDataShow


- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return _imageName.length == 0 ? nil : [UIImage imageNamed:_imageName];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    return self.titleAttributedText;
}

- (NSAttributedString *)titleAttributedText {
    if (!_titleAttributedText) {
        _titleAttributedText = [[NSMutableAttributedString alloc] initWithString:self.title
                                                                      attributes:@{NSFontAttributeName: self.titleFont,
                                                                                   NSForegroundColorAttributeName: self.titleColor}];
    }
    return _titleAttributedText;
}

- (UIFont *)titleFont {
    if (!_titleFont) {
        _titleFont = [UIFont systemFontOfSize:17];
    }
    return _titleFont;
}

- (UIColor *)titleColor {
    if (!_titleColor) {
        _titleColor = [UIColor blackColor];
    }
    return _titleColor;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return _emptyDataSetShouldAllowScroll;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return self.verticalOffset;
}



- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view {
    if (self.emptyDataDidTapViewBlock) {
        self.emptyDataDidTapViewBlock(scrollView,view);
    }
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    if (self.emptyDataDidTapButtonBlock) {
        self.emptyDataDidTapButtonBlock(scrollView,button);
    }
}

@end
