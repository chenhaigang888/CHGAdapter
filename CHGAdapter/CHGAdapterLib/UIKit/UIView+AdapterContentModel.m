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


static const void * tableViewCellClassNameKey = &tableViewCellClassNameKey;
static const void * tableViewCelllHeightKey = &tableViewCelllHeightKey;

static const void * tableViewHeaderClassNameKey = &tableViewHeaderClassNameKey;
static const void * tableViewHeaderHeightKey = &tableViewHeaderHeightKey;

static const void * tableViewFooterClassNameKey = &tableViewFooterClassNameKey;
static const void * tableViewFooterHeightKey = &tableViewFooterHeightKey;


static const void * collectionViewCellClassNameKey = &collectionViewCellClassNameKey;
static const void * collectionViewCellSizeKey = &collectionViewCellSizeKey;


static const void * collectionViewHeaderClassNameKey = &collectionViewHeaderClassNameKey;
static const void * collectionViewHeaderSizeKey = &collectionViewHeaderSizeKey;

static const void * collectionViewFooterClassNameKey = &collectionViewFooterClassNameKey;
static const void * collectionViewFooterSizeKey = &collectionViewFooterSizeKey;

@implementation UIView (AdapterContentModel)


#pragma - mark UITableViewCell extension
- (NSString *)tableViewCellClassName {
    return objc_getAssociatedObject(self, tableViewCellClassNameKey);
}

- (void)setTableViewCellClassName:(NSString *)tableViewCellClassName {
    objc_setAssociatedObject(self, tableViewCellClassNameKey, tableViewCellClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)tableViewCelllHeight {
    return [objc_getAssociatedObject(self, tableViewCelllHeightKey) floatValue];
}

- (void)setTableViewCelllHeight:(CGFloat)tableViewCelllHeight {
    objc_setAssociatedObject(self, tableViewCelllHeightKey, @(tableViewCelllHeight), OBJC_ASSOCIATION_ASSIGN);
}

#pragma - mark CHGTableViewCellModelProtocol method

- (NSString *)cellClassNameInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return self.tableViewCellClassName.length == 0 ? DEFAULT_TABLEVIEW_CELL : self.tableViewCellClassName;
}

- (CGFloat)cellHeighInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return self.tableViewCelllHeight;
}

#pragma - mark UITableViewFooter extension

- (NSString *)tableViewFooterClassName {
    return objc_getAssociatedObject(self, tableViewFooterClassNameKey);
}

- (void)setTableViewFooterClassName:(NSString *)tableViewFooterClassName {
    objc_setAssociatedObject(self, tableViewFooterClassNameKey, tableViewFooterClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)tableViewFooterHeight {
    return [objc_getAssociatedObject(self, tableViewFooterHeightKey) floatValue];
}

- (void)setTableViewFooterHeight:(CGFloat)tableViewFooterHeight {
    objc_setAssociatedObject(self, tableViewFooterHeightKey, @(tableViewFooterHeight), OBJC_ASSOCIATION_ASSIGN);
}

#pragma - mark UITableViewHeader extension

- (CGFloat)tableViewHeaderHeight {
    return [objc_getAssociatedObject(self, tableViewHeaderHeightKey) floatValue];
}

- (void)setTableViewHeaderHeight:(CGFloat)tableViewHeaderHeight {
    objc_setAssociatedObject(self, tableViewHeaderHeightKey, @(tableViewHeaderHeight), OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)tableViewHeaderClassName {
    return objc_getAssociatedObject(self, tableViewHeaderClassNameKey);
}

- (void)setTableViewHeaderClassName:(NSString *)tableViewHeaderClassName {
    objc_setAssociatedObject(self, tableViewHeaderClassNameKey, tableViewHeaderClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma - mark CHGTableViewHeaderFooterModelProtocol method

- (NSString *)headerFooterClassInTableViw:(UITableView *)tableView section:(NSInteger)section type:(CHGTableViewHeaderFooterViewType)type {
    if (type == CHGTableViewHeaderFooterViewHeaderType) {
        if (self.tableViewHeaderClassName.length == 0) {
            return DEFAULT_TABLEVIEW_HEADER_FOOTER_VIEW;
        } else {
            return self.tableViewHeaderClassName;
        }
    } else {
        if (self.tableViewFooterClassName.length == 0) {
            return DEFAULT_TABLEVIEW_HEADER_FOOTER_VIEW;
        } else {
            return self.tableViewFooterClassName;
        }
    }
}

- (CGFloat)headerFooterHeighInTableViw:(UITableView *)tableView section:(NSInteger)section type:(CHGTableViewHeaderFooterViewType)type {
    if (type == CHGTableViewHeaderFooterViewHeaderType) {
        if (self.tableViewHeaderHeight == 0) {
            UIView * view = [tableView.tableViewAdapter headerFooterDataWithType:type section:section];
            return view.frame.size.height;
        }
        return self.tableViewHeaderHeight;
    } else {
        if (self.tableViewFooterHeight == 0) {
            UIView * view = [tableView.tableViewAdapter headerFooterDataWithType:type section:section];
            return view.frame.size.height;
        }
        return self.tableViewFooterHeight;
    }
}

#pragma - mark collectionView cell
- (NSString *)collectionViewCellClassName {
    return objc_getAssociatedObject(self, collectionViewCellClassNameKey);
}

- (void)setCollectionViewCellClassName:(NSString *)collectionViewCellClassName {
    objc_setAssociatedObject(self, collectionViewCellClassNameKey, collectionViewCellClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGSize)collectionViewCellSize {
    return [objc_getAssociatedObject(self, collectionViewCellSizeKey) CGSizeValue];
}

- (void)setCollectionViewCellSize:(CGSize)collectionViewCellSize {
    objc_setAssociatedObject(self, collectionViewCellSizeKey, [NSValue valueWithCGSize:collectionViewCellSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma - mark CHGCollectionViewCellModelProtocol method

- (NSString *)cellClassNameInCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath {
    if (self.collectionViewCellClassName.length == 0) {
        return DEFAULT_COLLECTIONVIEW_CELL;
    }
    return self.collectionViewCellClassName;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionViewCellSize;
}

#pragma - mark collectionView header
- (NSString *)collectionViewHeaderClassName {
    return objc_getAssociatedObject(self, collectionViewHeaderClassNameKey);
}

- (void)setCollectionViewHeaderClassName:(NSString *)collectionViewHeaderClassName {
    objc_setAssociatedObject(self, collectionViewHeaderClassNameKey, collectionViewHeaderClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGSize)collectionViewHeaderSize {
    return [objc_getAssociatedObject(self, collectionViewHeaderSizeKey) CGSizeValue];
}

- (void)setCollectionViewHeaderSize:(CGSize)collectionViewHeaderSize {
    objc_setAssociatedObject(self, collectionViewHeaderSizeKey, [NSValue valueWithCGSize:collectionViewHeaderSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma - mark collectionView footer
- (NSString *)collectionViewFooterClassName {
    return objc_getAssociatedObject(self, collectionViewFooterClassNameKey);
}

- (void)setCollectionViewFooterClassName:(NSString *)collectionViewFooterClassName {
    objc_setAssociatedObject(self, collectionViewFooterClassNameKey, collectionViewFooterClassName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGSize)collectionViewFooterSize {
    return [objc_getAssociatedObject(self, collectionViewFooterSizeKey) CGSizeValue];
}

- (void)setCollectionViewFooterSize:(CGSize)collectionViewFooterSize {
    objc_setAssociatedObject(self, collectionViewFooterSizeKey, [NSValue valueWithCGSize:collectionViewFooterSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma - mark CHGCollectionViewSupplementaryElementModelProtocol method
- (NSString *)reusableViewInCollectionView:(UICollectionView *)collectionView supplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:@"UICollectionElementKindSectionHeader"]) {
        if (self.collectionViewHeaderClassName.length == 0) {
            return DEFAULT_COLLECTIONVIEW_HEADER_FOOTER_VIEW;
        } else {
            return self.collectionViewHeaderClassName;
        }
    } else {//UICollectionElementKindSectionFooter
        if (self.collectionViewFooterClassName.length == 0) {
            return DEFAULT_COLLECTIONVIEW_HEADER_FOOTER_VIEW;
        } else {
            return self.collectionViewFooterClassName;
        }
    }
    
}

///动态设置某个分区头视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return self.collectionViewHeaderSize;
}

//动态设置某个分区尾视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return self.collectionViewFooterSize;
}

@end
