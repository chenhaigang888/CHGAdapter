//
//  MessageModel.m
//  CHGAdapter
//
//  Created by dnaer5 on 2021/6/16.
//  Copyright © 2021 chen haiGang. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

- (NSString *)cellClassNameInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return @"MessageModelTableViewCell";
}

- (CGFloat)cellHeighInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (BOOL)cellCanEditInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)editingStyleInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (NSString *)titleForDeleteConfirmationButtonInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return @"删除";
}


//以下为自定义添加的选项方法

//- (NSArray<UITableViewRowAction *> *)editActionsInTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
//    UITableViewRowAction * action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"normal" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        if (tableView.eventTransmissionBlock) {//动作传递到controller中处理
//            tableView.eventTransmissionBlock(self, self, 0, nil);
//        }
//    }];
//
//    UITableViewRowAction * action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Default" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        if (tableView.eventTransmissionBlock) {
//            tableView.eventTransmissionBlock(self, self, 1, nil);
//        }
//    }];
//
//    UITableViewRowAction * action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Destructive" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        if (tableView.eventTransmissionBlock) {
//            tableView.eventTransmissionBlock(self, self, 2, nil);
//        }
//    }];
//
//    return @[action1,action2,action3];
//}

@end
