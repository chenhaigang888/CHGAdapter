//
//  CHGBaseViewViewController.m
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/25.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "CHGBaseViewViewController.h"
#import "CHGAdapter.h"
#import "CHGBaseViewTest1Model.h"

@interface CHGBaseViewViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation CHGBaseViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.cellDatas = @[[CHGBaseViewTest1Model new],[CHGBaseViewTest1Model new]];
    self.tableView.tableViewAdapter.headerHeight = 0.001;
    self.tableView.tableViewAdapter.footerHeight = 0.001;
    
}



@end
