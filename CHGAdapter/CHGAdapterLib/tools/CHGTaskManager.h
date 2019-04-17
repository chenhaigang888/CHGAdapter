//
//  CHGTaskManager.h
//
//  Created by 陈 海刚 on 2019/3/10.
//  Copyright © 2019 陈 海刚. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 任务
 */
typedef void(^CHGRunloopTaskBlock)(void);

@interface CHGTaskManager : NSObject

+(_Nonnull instancetype) sharedInstance;
// clue for improper use (produces compile time error)
+(_Nonnull instancetype) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
-(_Nonnull instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));
+(_Nonnull instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));


///最大任务数
@property(nonatomic, assign) NSInteger maxTask;

/**
 添加任务
 
 @param task 任务
 */
-(void)addTask:(CHGRunloopTaskBlock)task;

/**
 移除任务
 
 @param task 任务
 */
-(void)removeTask:(CHGRunloopTaskBlock)task;

@end

NS_ASSUME_NONNULL_END
