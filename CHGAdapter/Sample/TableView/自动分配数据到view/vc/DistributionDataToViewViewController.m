//
//  DistributionDataToViewViewController.m
//  CHGAdapter
//
//  Created by dnaer5 on 2020/5/12.
//  Copyright © 2020 chen haiGang. All rights reserved.
//

#import "DistributionDataToViewViewController.h"
#import "FoundModel.h"

@interface DistributionDataToViewViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DistributionDataToViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.cellDatas = @[[self createData]];
}


-(NSArray*)createData{
    NSMutableArray * array = [NSMutableArray array];
    FoundModel *found;
    for (int i=0; i<100; i++) {
        found = [FoundModel initWithUser:[User initWithName:[NSString stringWithFormat:@"名字：%i",i]
                                                        age:[NSString stringWithFormat:@"年龄：%i",i]
                                                    headUrl:[NSString stringWithFormat:@"headUrl:%i",i]]
                             interaction:[Interaction initWithLove:[NSString stringWithFormat:@"love:%i",i]
                                                             share:[NSString stringWithFormat:@"share:%i",i]
                                                           collect:[NSString stringWithFormat:@"collect:%i",i]]];
        [array addObject:found];
    }
    return array;
}



@end
