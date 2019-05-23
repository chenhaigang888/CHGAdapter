//
//  CHGTableViewCell.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+CHGTableViewAdapter.h"
#import "CHGCellLifeCycleProtocol.h"

@interface CHGTableViewCell : UITableViewCell<CHGCellLifeCycleProtocol>

///cell分割线高度
@property(nonatomic,assign) CGFloat dividerHeight;

-(UITableView*)getTableView;


@end
