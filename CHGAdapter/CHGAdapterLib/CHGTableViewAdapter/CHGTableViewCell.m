//
//  CHGTableViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGTableViewCell.h"


@implementation CHGTableViewCell

@synthesize model = _model;

@synthesize indexPath = _indexPath;

@synthesize targetView = _targetView;

@synthesize eventTransmissionBlock = _eventTransmissionBlock;

@synthesize protocolsVMO = _protocolsVMO;


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpSubviews];
        [self setLayout];
    }
    return self;
}

- (NSMutableArray<CHGViewMappingObject *> *)protocolsVMO {
    if (!_protocolsVMO) {
        _protocolsVMO = [NSMutableArray<CHGViewMappingObject *> array];
    }
    return _protocolsVMO;
}


-(UITableView*)getTableView {
    return (UITableView*)self.targetView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setUpSubviews {
    //子类可在此添加subViews
}

-(void)setLayout {
    //子类可在此布局
}

/**
 获取当前Adapter的tag
 
 @return 返回tag
 */
-(NSInteger)adapterTag {
    return ((UITableView*)self.targetView).tableViewAdapter.tag;
}

/**
 获取AdapterData中的customData
 
 @return 获取AdapterData中的customData
 */
-(id)customData {
    return ((UITableView*)self.targetView).tableViewAdapter.adapterData.customData;
}

/**
 返回当前cell所在的controller
 
 @return 返回当前cell所在的controller
 */
-(UIViewController*)controller {
    return ((UITableView*)self.targetView).tableViewAdapter.controller;
}

- (void)setFrame:(CGRect)frame {
    frame.size.height -= self.dividerHeight;    // 减掉的值就是分隔线的高度
    [super setFrame:frame];
}




/**
 cell将要显示
 */
-(void)cellWillAppear {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGViewLifeCycleProtocol>)vmo.view) cellWillAppear];
    }
}

/**
 cell已经消失
 */
-(void)cellDidDisappear {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGViewLifeCycleProtocol>)vmo.view) cellDidDisappear];
    }
}



- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView model:(id)model eventTransmissionBlock:(CHGEventTransmissionBlock)eventTransmissionBlock{
    self.indexPath = indexPath;
    self.targetView = targetView;
    self.model = model;
    self.eventTransmissionBlock = eventTransmissionBlock;
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        NSDictionary * mapping = vmo.mapping;
        if (mapping) {
            NSString * key = mapping[@(CHGAdapterViewTypeCellType)];
            if (key.length > 0) {
                id subModel = [model objectForKey:key];
                [((id<CHGViewLifeCycleProtocol>)vmo.view) cellForRowAtIndexPath:indexPath targetView:targetView model:subModel eventTransmissionBlock:eventTransmissionBlock];
            } else {
                [((id<CHGViewLifeCycleProtocol>)vmo.view) cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
            }
        } else {
            [((id<CHGViewLifeCycleProtocol>)vmo.view) cellForRowAtIndexPath:indexPath targetView:targetView model:model eventTransmissionBlock:eventTransmissionBlock];
        }
    }
}

- (void)cellWillReuseWithIdentifier:(nonnull NSString *)identifier {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGViewLifeCycleProtocol>)vmo.view) cellWillReuseWithIdentifier:identifier];
    }
}


- (void)cellWillReuseWithIdentifier:(nonnull NSString *)identifier indexPath:(nonnull NSIndexPath *)indexPath {
    for (CHGViewMappingObject * vmo in self.protocolsVMO) {
        [((id<CHGViewLifeCycleProtocol>)vmo.view) cellWillReuseWithIdentifier:identifier indexPath:indexPath];
    }
}




@end
