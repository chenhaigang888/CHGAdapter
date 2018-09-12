//
//  CHGSubDataOfKeyPathDelegate.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/9/12.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CHGSubDataOfKeyPathDelegate <NSObject>

-(NSString*)subDataKeyPathWithIndexPath:(NSIndexPath*)indexPath targetView:(UIScrollView*)targetView;

@end
