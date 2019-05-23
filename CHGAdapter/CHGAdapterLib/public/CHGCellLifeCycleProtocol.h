//
//  CHGCellLifeCycleProtocol.h
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/23.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 cell的生命周期协议
 */
@protocol CHGCellLifeCycleProtocol <NSObject>

@property(nonatomic,copy) CHGEventTransmissionBlock eventTransmissionBlock;//当前数据可通过此block向外部传递
@property(nonatomic,strong) NSIndexPath * indexPath;//当前cell的indexPath信息
@property(nonatomic,weak) UIView * targetView;//当前Cell所在的tableView、collectionView
@property(nonatomic,strong) id cellData;//当前cell需要显示的数据

/**
 获取当前Adapter的tag
 
 @return 返回tag
 */
-(NSInteger)adapterTag;

/**
 获取AdapterData中的customData
 
 @return 获取AdapterData中的customData
 */
-(id)customData;

/**
 返回当前cell所在的controller
 
 @return 返回当前cell所在的controller
 */
-(UIViewController*)controller;

/**
 初始化子view
 */
-(void)setUpSubviews;

/**
 布局子view
 */
-(void)setLayout;

/**
 必须重写这个方法 子类应该在这个方法中给cell中的各个view设定value
 @param indexPath 当前cell在UITableView中的位置
 @param targetView 当前cell所在的UITableView、UICollectionView
 @param data 当前Cell的数据
 */
-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView*)targetView withData:(id)data;

/**
 将被复用
 
 @param identifier identifier
 */
-(void)willReuseWithIdentifier:(NSString*)identifier;

/**
 将被复用
 
 @param identifier identifier
 @param indexPath indexPath
 */
-(void)willReuseWithIdentifier:(NSString*)identifier indexPath:(NSIndexPath*)indexPath;

/**
 cell将要显示
 */
-(void)cellWillAppear;

/**
 cell已经消失
 */
-(void)cellDidDisappear;

@end

NS_ASSUME_NONNULL_END
