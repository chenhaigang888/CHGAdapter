//
//  ScrollListener.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/6.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void(^ScrollViewDidScrollBlock)(UIScrollView * scrollView);

typedef void(^ScrollViewDidZoomBlock)(UIScrollView * scrollView);

typedef void(^ScrollViewWillBeginDraggingBlock)(UIScrollView * scrollView);

typedef void(^ScrollViewWillEndDraggingBlock)(UIScrollView * scrollView, CGPoint velocity,CGPoint targetContentOffset);

typedef void(^ScrollViewDidEndDraggingBlock)(UIScrollView * scrollView,BOOL decelerate);

typedef void(^ScrollViewWillBeginDeceleratingBlock)(UIScrollView * scrollView);

typedef void(^ScrollViewDidEndDeceleratingBlock)(UIScrollView * scrollView);

typedef void(^ScrollViewDidEndScrollingAnimationBlock)(UIScrollView * scrollView);

typedef UIView*(^ViewForZoomingBlock)(UIScrollView * scrollView);

typedef void(^ScrollViewWillBeginZoomingBlock)(UIScrollView * scrollView, UIView * view);

typedef void(^ScrollViewDidEndZoomingBlock)(UIScrollView * scrollView,UIView * view,CGFloat scale);

typedef BOOL(^ScrollViewShouldScrollToTopBlock)(UIScrollView * scrollView);

typedef void(^ScrollViewDidScrollToTopBlock)(UIScrollView * scrollView);

typedef void(^ScrollViewDidChangeAdjustedContentInsetBlock)(UIScrollView * scrollView);

/**
 UIScrollView deletage listener block
 */
@interface CHGScrollListener : NSObject

@property (nonatomic,copy) ScrollViewDidScrollBlock scrollViewDidScrollBlock;
@property (nonatomic,copy) ScrollViewDidZoomBlock scrollViewDidZoomBlock;
@property (nonatomic,copy) ScrollViewWillBeginDraggingBlock scrollViewWillBeginDraggingBlock;
@property (nonatomic,copy) ScrollViewWillEndDraggingBlock scrollViewWillEndDraggingBlock;
@property (nonatomic,copy) ScrollViewDidEndDraggingBlock scrollViewDidEndDraggingBlock;
@property (nonatomic,copy) ScrollViewWillBeginDeceleratingBlock scrollViewWillBeginDeceleratingBlock;
@property (nonatomic,copy) ScrollViewDidEndDeceleratingBlock scrollViewDidEndDeceleratingBlock;
@property (nonatomic,copy) ScrollViewDidEndScrollingAnimationBlock scrollViewDidEndScrollingAnimationBlock;
@property (nonatomic,copy) ViewForZoomingBlock viewForZoomingBlock;
@property (nonatomic,copy) ScrollViewWillBeginZoomingBlock scrollViewWillBeginZoomingBlock;
@property (nonatomic,copy) ScrollViewDidEndZoomingBlock scrollViewDidEndZoomingBlock;
@property (nonatomic,copy) ScrollViewShouldScrollToTopBlock scrollViewShouldScrollToTopBlock;
@property (nonatomic,copy) ScrollViewDidScrollToTopBlock scrollViewDidScrollToTopBlock;
@property (nonatomic,copy) ScrollViewDidChangeAdjustedContentInsetBlock scrollViewDidChangeAdjustedContentInsetBlock;

@end
