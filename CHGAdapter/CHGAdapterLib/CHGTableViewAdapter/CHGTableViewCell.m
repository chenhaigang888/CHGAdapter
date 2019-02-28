//
//  CHGTableViewCell.m
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGTableViewCell.h"

@implementation CHGTableViewCell

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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setUpSubviews {
    //子类可在此添加subViews
}

-(void)setLayout {
    //子类可在此布局
}

-(void)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView withData:(id)data {
    self.indexPath = indexPath;
    self.tableView = tableView;
    self.cellData = data;
}

/**
 获取当前Adapter的tag
 
 @return 返回tag
 */
-(NSInteger)adapterTag {
    return self.tableView.tableViewAdapter.tag;
}

/**
 获取AdapterData中的customData
 
 @return 获取AdapterData中的customData
 */
-(id)customData {
    return self.tableView.tableViewAdapter.adapterData.customData;
}

/**
 返回当前cell所在的controller
 
 @return 返回当前cell所在的controller
 */
-(UIViewController*)controller {
    return self.tableView.tableViewAdapter.controller;
}

- (void)setFrame:(CGRect)frame {
    frame.size.height -= self.dividerHeight;    // 减掉的值就是分隔线的高度
    [super setFrame:frame];
}

/**
 将被复用
 
 @param identifier identifier
 */
-(void)willReuseWithIdentifier:(NSString*)identifier {
    
}

/**
 将被复用
 
 @param identifier identifier
 @param indexPath indexPath
 */
-(void)willReuseWithIdentifier:(NSString*)identifier indexPath:(NSIndexPath*)indexPath {
    
}

/**
 cell将要显示
 */
-(void)cellWillAppear {
    
}

/**
 cell已经消失
 */
-(void)cellDidDisappear {
    
}

@end
