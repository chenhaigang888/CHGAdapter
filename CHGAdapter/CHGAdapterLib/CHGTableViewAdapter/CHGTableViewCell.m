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

@end
