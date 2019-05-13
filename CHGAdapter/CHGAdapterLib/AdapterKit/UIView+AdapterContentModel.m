//
//  UIView+AdapterContentModel.m
//  CHGAdapter
//
//  Created by 陈 海刚 on 2019/3/10.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "UIView+AdapterContentModel.h"
#import <objc/runtime.h>

/// 默认的tableVeiwCell
#define DEFAULT_TABLEVIEW_CELL @"CHGOneViewTableViewCell"
#define DEFAULT_TABLEVIEW_CELL_HEIGHT -1

/// 默认的TableViewHeaderFooterView
#define DEFAULT_TABLEVIEW_HEADER_FOOTER_VIEW @"CHGOneViewTableViewHeaderFooterView"


/// 默认的CollectionViewCell
#define DEFAULT_COLLECTIONVIEW_CELL @"CHGOneViewCollectionViewCell"
/// 默认的CollectionViewHeaderFooterView
#define DEFAULT_COLLECTIONVIEW_HEADER_FOOTER_VIEW @"CHGOneViewCollectionReusableView"


static const void * chg_tableViewCellClassNameKey = &chg_tableViewCellClassNameKey;
static const void * chg_tableViewCelllHeightKey = &chg_tableViewCelllHeightKey;

static const void * chg_tableViewHeaderClassNameKey = &chg_tableViewHeaderClassNameKey;
static const void * chg_tableViewHeaderHeightKey = &chg_tableViewHeaderHeightKey;

static const void * chg_tableViewFooterClassNameKey = &chg_tableViewFooterClassNameKey;
static const void * chg_tableViewFooterHeightKey = &chg_tableViewFooterHeightKey;


static const void * chg_collectionViewCellClassNameKey = &chg_collectionViewCellClassNameKey;
static const void * chg_collectionViewCellSizeKey = &chg_collectionViewCellSizeKey;


static const void * chg_collectionViewHeaderClassNameKey = &chg_collectionViewHeaderClassNameKey;
static const void * chg_collectionViewHeaderSizeKey = &chg_collectionViewHeaderSizeKey;

static const void * chg_collectionViewFooterClassNameKey = &chg_collectionViewFooterClassNameKey;
static const void * chg_collectionViewFooterSizeKey = &chg_collectionViewFooterSizeKey;

@implementation UIView (AdapterContentModel)


#pragma - mark UITableViewCell extension
- (NSString *)chg_tableViewCellClassName {
    return objc_getAssociatedObject(self, chg_tableViewCellClassNameKey);
}

- (void)setChg_tableViewCellClassName:(NSString *)chg_tableViewCellClassName {
    objc_setAssociatedObject(self, chg_tableViewCellClassNameKey, chg_tableViewCellClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)chg_tableViewCelllHeight {
    return [objc_getAssociatedObject(self, chg_tableViewCelllHeightKey) floatValue];
}

- (void)setChg_tableViewCelllHeight:(CGFloat)chg_tableViewCelllHeight {
    objc_setAssociatedObject(self, chg_tableViewCelllHeightKey, @(chg_tableViewCelllHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma - mark CHGTableViewCellModelProtocol method

- (NSString *)cellClassNameInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return self.chg_tableViewCellClassName.length == 0 ? DEFAULT_TABLEVIEW_CELL : self.chg_tableViewCellClassName;
}

- (CGFloat)cellHeighInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return self.chg_tableViewCelllHeight;
}

#pragma - mark UITableViewFooter extension

- (NSString *)chg_tableViewFooterClassName {
    return objc_getAssociatedObject(self, chg_tableViewFooterClassNameKey);
}

- (void)setChg_tableViewFooterClassName:(NSString *)chg_tableViewFooterClassName {
    objc_setAssociatedObject(self, chg_tableViewFooterClassNameKey, chg_tableViewFooterClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)chg_tableViewFooterHeight {
    return [objc_getAssociatedObject(self, chg_tableViewFooterHeightKey) floatValue];
}

- (void)setChg_tableViewFooterHeight:(CGFloat)chg_tableViewFooterHeight {
    objc_setAssociatedObject(self, chg_tableViewFooterHeightKey, @(chg_tableViewFooterHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma - mark UITableViewHeader extension
- (CGFloat)chg_tableViewHeaderHeight {
    return [objc_getAssociatedObject(self, chg_tableViewHeaderHeightKey) floatValue];
}

- (void)setChg_tableViewHeaderHeight:(CGFloat)chg_tableViewHeaderHeight {
    NSLog(@"tableViewHeaderHeight:%f",chg_tableViewHeaderHeight);
    objc_setAssociatedObject(self, chg_tableViewHeaderHeightKey, @(chg_tableViewHeaderHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)chg_tableViewHeaderClassName {
    return objc_getAssociatedObject(self, chg_tableViewHeaderClassNameKey);
}

- (void)setChg_tableViewHeaderClassName:(NSString *)chg_tableViewHeaderClassName {
    objc_setAssociatedObject(self, chg_tableViewHeaderClassNameKey, chg_tableViewHeaderClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma - mark CHGTableViewHeaderFooterModelProtocol method

- (NSString *)headerFooterClassInTableViw:(UITableView *)tableView section:(NSInteger)section type:(CHGTableViewHeaderFooterViewType)type {
    if (type == CHGTableViewHeaderFooterViewHeaderType) {
        if (self.chg_tableViewHeaderClassName.length == 0) {
            return DEFAULT_TABLEVIEW_HEADER_FOOTER_VIEW;
        } else {
            return self.chg_tableViewHeaderClassName;
        }
    } else {
        if (self.chg_tableViewFooterClassName.length == 0) {
            return DEFAULT_TABLEVIEW_HEADER_FOOTER_VIEW;
        } else {
            return self.chg_tableViewFooterClassName;
        }
    }
}

- (CGFloat)headerFooterHeighInTableViw:(UITableView *)tableView section:(NSInteger)section type:(CHGTableViewHeaderFooterViewType)type {
    if (type == CHGTableViewHeaderFooterViewHeaderType) {
        if (self.chg_tableViewHeaderHeight == 0) {
            UIView * view = [tableView.tableViewAdapter headerFooterDataWithType:type section:section];
            return view.frame.size.height;
        }
        return self.chg_tableViewHeaderHeight;
    } else {
        if (self.chg_tableViewFooterHeight == 0) {
            UIView * view = [tableView.tableViewAdapter headerFooterDataWithType:type section:section];
            return view.frame.size.height;
        }
        return self.chg_tableViewFooterHeight;
    }
}

#pragma - mark collectionView cell
- (NSString *)chg_collectionViewCellClassName {
    return objc_getAssociatedObject(self, chg_collectionViewCellClassNameKey);
}

- (void)setChg_collectionViewCellClassName:(NSString *)chg_collectionViewCellClassName {
    objc_setAssociatedObject(self, chg_collectionViewCellClassNameKey, chg_collectionViewCellClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (CGSize)chg_collectionViewCellSize {
    return [objc_getAssociatedObject(self, chg_collectionViewCellSizeKey) CGSizeValue];
}

- (void)setChg_collectionViewCellSize:(CGSize)chg_collectionViewCellSize {
    objc_setAssociatedObject(self, chg_collectionViewCellSizeKey, [NSValue valueWithCGSize:chg_collectionViewCellSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma - mark CHGCollectionViewCellModelProtocol method

- (NSString *)cellClassNameInCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath {
    if (self.chg_collectionViewCellClassName.length == 0) {
        return DEFAULT_COLLECTIONVIEW_CELL;
    }
    return self.chg_collectionViewCellClassName;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.chg_collectionViewCellSize;
}

#pragma - mark collectionView header
- (NSString *)chg_collectionViewHeaderClassName {
    return objc_getAssociatedObject(self, chg_collectionViewHeaderClassNameKey);
}

- (void)setChg_collectionViewHeaderClassName:(NSString *)chg_collectionViewHeaderClassName {
    objc_setAssociatedObject(self, chg_collectionViewHeaderClassNameKey, chg_collectionViewHeaderClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGSize)chg_collectionViewHeaderSize {
    return [objc_getAssociatedObject(self, chg_collectionViewHeaderSizeKey) CGSizeValue];
}

- (void)setChg_collectionViewHeaderSize:(CGSize)chg_collectionViewHeaderSize {
    objc_setAssociatedObject(self, chg_collectionViewHeaderSizeKey, [NSValue valueWithCGSize:chg_collectionViewHeaderSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma - mark collectionView footer
- (NSString *)chg_collectionViewFooterClassName {
    return objc_getAssociatedObject(self, chg_collectionViewFooterClassNameKey);
}

- (void)setChg_collectionViewFooterClassName:(NSString *)chg_collectionViewFooterClassName {
    objc_setAssociatedObject(self, chg_collectionViewFooterClassNameKey, chg_collectionViewFooterClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGSize)chg_collectionViewFooterSize {
    return [objc_getAssociatedObject(self, chg_collectionViewFooterSizeKey) CGSizeValue];
}

- (void)setChg_collectionViewFooterSize:(CGSize)chg_collectionViewFooterSize {
    objc_setAssociatedObject(self, chg_collectionViewFooterSizeKey, [NSValue valueWithCGSize:chg_collectionViewFooterSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma - mark CHGCollectionViewSupplementaryElementModelProtocol method
- (NSString *)reusableViewInCollectionView:(UICollectionView *)collectionView supplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:@"UICollectionElementKindSectionHeader"]) {
        if (self.chg_collectionViewHeaderClassName.length == 0) {
            return DEFAULT_COLLECTIONVIEW_HEADER_FOOTER_VIEW;
        } else {
            return self.chg_collectionViewHeaderClassName;
        }
    } else {//UICollectionElementKindSectionFooter
        if (self.chg_collectionViewFooterClassName.length == 0) {
            return DEFAULT_COLLECTIONVIEW_HEADER_FOOTER_VIEW;
        } else {
            return self.chg_collectionViewFooterClassName;
        }
    }
    
}

///动态设置某个分区头视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return self.chg_collectionViewHeaderSize;
}

//动态设置某个分区尾视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return self.chg_collectionViewFooterSize;
}

@end
