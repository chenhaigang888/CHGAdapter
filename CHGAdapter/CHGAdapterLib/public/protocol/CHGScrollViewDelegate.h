//
//  CHGScrollViewDelegate.h
//  CHGAdapter
//
//  Created by dnaer5 on 2020/5/13.
//  Copyright © 2020 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/// 封装的UIScrollViewDelegate
@protocol CHGScrollViewDelegate <NSObject>

@optional
- (void)chg_scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)chg_scrollViewDidZoom:(UIScrollView *)scrollView API_AVAILABLE(ios(3.2));


- (void)chg_scrollViewWillBeginDragging:(UIScrollView *)scrollView;

- (void)chg_scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset API_AVAILABLE(ios(5.0));

- (void)chg_scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

- (void)chg_scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;
- (void)chg_scrollViewDidEndDecelerating:(UIScrollView *)scrollView;

- (void)chg_scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;

- (nullable UIView *)chg_viewForZoomingInScrollView:(UIScrollView *)scrollView;
- (void)chg_scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view API_AVAILABLE(ios(3.2));
- (void)chg_scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale;

- (BOOL)chg_scrollViewShouldScrollToTop:(UIScrollView *)scrollView;
- (void)chg_scrollViewDidScrollToTop:(UIScrollView *)scrollView;
- (void)chg_scrollViewDidChangeAdjustedContentInset:(UIScrollView *)scrollView API_AVAILABLE(ios(11.0), tvos(11.0));

@end

NS_ASSUME_NONNULL_END
