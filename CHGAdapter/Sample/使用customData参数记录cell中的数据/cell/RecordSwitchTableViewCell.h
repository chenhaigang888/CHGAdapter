//
//  RecordSwitchTableViewCell.h
//  demo
//
//  Created by chen haiGang on 2018/5/14.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import "CHGTableViewCell.h"

@interface RecordSwitchTableViewCell : CHGTableViewCell

@property(nonatomic,weak) IBOutlet UILabel * title;
@property(nonatomic,weak) IBOutlet UISwitch * switch_;

@end
