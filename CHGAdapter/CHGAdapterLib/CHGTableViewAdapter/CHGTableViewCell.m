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

@synthesize protocols = _protocols;


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setEventTransmissionBlock:(CHGEventTransmissionBlock)eventTransmissionBlock {
    _eventTransmissionBlock = eventTransmissionBlock;
    for (id protocol in self.protocols) {
        [protocol setEventTransmissionBlock:eventTransmissionBlock];
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpSubviews];
        [self setLayout];
    }
    return self;
}

- (NSMutableArray *)protocols {
    if (!_protocols) {
        _protocols = [NSMutableArray array];
    }
    return _protocols;
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
    for (id protocol in self.protocols) {
        [protocol cellWillAppear];
    }
}

/**
 cell已经消失
 */
-(void)cellDidDisappear {
    for (id protocol in self.protocols) {
        [protocol cellDidDisappear];
    }
}

- (void)cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath targetView:(nonnull UIView *)targetView withData:(nonnull id)data {
    self.indexPath = indexPath;
    self.targetView = targetView;
    self.model = data;
    for (id protocol in self.protocols) {
        [protocol cellForRowAtIndexPath:indexPath targetView:targetView withData:data];
    }
}

- (void)cellWillReuseWithIdentifier:(nonnull NSString *)identifier {
    for (id protocol in self.protocols) {
        [protocol cellWillReuseWithIdentifier:identifier];
    }
}


- (void)cellWillReuseWithIdentifier:(nonnull NSString *)identifier indexPath:(nonnull NSIndexPath *)indexPath {
    for (id protocol in self.protocols) {
        [protocol cellWillReuseWithIdentifier:identifier indexPath:indexPath];
    }
}




@end
