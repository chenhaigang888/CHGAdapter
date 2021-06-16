//
//  SlidingDeleteViewController.m
//  CHGAdapter
//
//  Created by dnaer5 on 2021/6/16.
//  Copyright © 2021 chen haiGang. All rights reserved.
//

#import "SlidingDeleteViewController.h"
#import "CHGAdapter.h"
#import "MessageModel.h"

@interface SlidingDeleteViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SlidingDeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.cellDatas = @[[self messages]];
    
    self.tableView.tableViewWillBeginEditingBlock = ^(UITableView *tableView, NSIndexPath *indexPath, id itemData) {
        MessageModel * message = itemData;
        NSLog(@"tableViewWillBeginEditingBlock：%@",message.title);
    };
    
    self.tableView.tableViewDidEndEditingBlock = ^(UITableView *tableView, NSIndexPath *indexPath, id itemData) {
        MessageModel * message = itemData;
        NSLog(@"tableViewDidEndEditingBlock：%@",message.title);
    };
    
    self.tableView.tableViewCommitEditForRowBlock = ^(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath, id itemData) {
        MessageModel * message = itemData;
        NSLog(@"tableViewCommitEditForRowBlock：%@",message.title);
    };
}

-(NSArray*)messages {
    NSMutableArray * msgs = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        MessageModel * msg = [MessageModel new];
        msg.title = [NSString stringWithFormat:@"消息%i",i];
        [msgs addObject:msg];
    }
    return msgs;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
