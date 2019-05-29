//
//  CHGBaseView.h
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/25.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHGViewLifeCycleProtocol.h"
#import "CHGTableViewHeaderFooterLifeCycleProtocol.h"
#import "CHGCollectionReusableViewLifeCycleProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CHGBaseView : UIView<CHGViewLifeCycleProtocol,CHGTableViewHeaderFooterLifeCycleProtocol,CHGCollectionReusableViewLifeCycleProtocol>

@end

NS_ASSUME_NONNULL_END
