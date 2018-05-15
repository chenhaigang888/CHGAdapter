//
//  CHGCollectionViewAdapter.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGCollectionViewAdapter.h"
#import "CHGCollectionViewCell.h"


@implementation CHGCollectionViewAdapter

-(NSString*)obtainCellNameWithCellData:(id)data collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellName;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSArray * cellDatas = self.adapterData.cellDatas;
    if (self.rowsOfSectionKeyName) {
        if ([cellDatas[0] isKindOfClass:[NSArray class]]) {//是数组
            return [cellDatas count];
        } else {//如果不是数组
            return [cellDatas count];
        }
    } else {
        if ([cellDatas[0] isKindOfClass:[NSArray class]]) {
            return [cellDatas count];
        } else {
            return 1;
        }
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    id cellDatas = self.adapterData.cellDatas;
    if ([cellDatas count] == 0) {
        return 0;
    }
    if (self.rowsOfSectionKeyName
        && ![cellDatas[section] isKindOfClass:[NSArray class]]
        ) {
        return [[cellDatas[section] valueForKey:self.rowsOfSectionKeyName] count];
    }
    id cellData = [cellDatas objectAtIndex:section];
    if ([cellData isKindOfClass:[NSArray class]]) {
        return cellData == nil ? 0 : [cellData count];
    } else {
        return [cellDatas count];
    }
    return 1;
}

/**
 获取cell的data
 
 @param indexPath indexPath
 @return 返回cell的data
 */
-(id)cellDataWithIndexPath:(NSIndexPath*)indexPath {
    if (self.adapterData.cellDatas.count == 0) {
        return nil;
    }
    id sectionData = self.adapterData.cellDatas[indexPath.section];
    id cellData = nil;
    if (self.rowsOfSectionKeyName
        && ![sectionData isKindOfClass:[NSArray class]]) {
        cellData = [sectionData valueForKey:self.rowsOfSectionKeyName][indexPath.row];
    } else {
        if ([sectionData isKindOfClass:[NSArray class]]) {
            cellData = sectionData[indexPath.row];
        } else {
            cellData = sectionData;
        }
    }
    return cellData;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id cellData = [self cellDataWithIndexPath:indexPath];
    //获取cell
    NSString * identifier = [self obtainCellNameWithCellData:cellData collectionView:collectionView cellForItemAtIndexPath:indexPath];
    if (identifier.length == 0) {
        return nil;
    }
    
    if ([self fileIsExit:identifier]) {
        [collectionView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellWithReuseIdentifier:identifier];
    } else {
        [collectionView registerClass:NSClassFromString(identifier) forCellWithReuseIdentifier:identifier];
    }
    CHGCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.eventTransmissionBlock = collectionView.eventTransmissionBlock;
    [cell cellForRowAtIndexPath:indexPath collectionView:collectionView withData:cellData];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

/**
 判断文件是否存在
 
 @param fileName 文件名称
 @return 返回文件是否存在的结果
 */
-(BOOL)fileIsExit:(NSString*)fileName {
    NSString * xib = [[NSBundle mainBundle] pathForResource:fileName ofType:@"nib"];
    return xib;
}

@end
