//
//  CHGTaskManager.m
//
//  Created by 陈 海刚 on 2019/3/10.
//  Copyright © 2019 陈 海刚. All rights reserved.
//

#import "CHGTaskManager.h"

#define CHG_TASK_MAX_COUNT 50

@interface CHGTaskManager()

@property(nonatomic, strong) NSMutableArray * tasks;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation CHGTaskManager

+(_Nonnull instancetype) sharedInstance {
    static dispatch_once_t pred;
    static id baseSingleTon = nil;
    dispatch_once(&pred, ^{
        baseSingleTon = [super new];
    });
    return baseSingleTon;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addRunloopObserver];
        [self timer];
    }
    return self;
}

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (NSInteger)maxTask {
    return _maxTask == 0 ? CHG_TASK_MAX_COUNT : _maxTask;
}

-(void)timerMethod {
    //    NSLog(@"-----timer-----");
}


/**
 添加runlooop观察者
 */
-(void)addRunloopObserver {
    //1.获取runloop
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    //传递context
    CFRunLoopObserverContext context = {
        0,
        (__bridge void *)(self),
        &CFRetain,
        &CFRelease,
        NULL
    };
    //定义观察者
    //    static CFRunLoopObserverRef runloopObserver;
    CFRunLoopObserverRef runloopObserver = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting, YES, 0, &CHG_callBack, &context);
    //添加观察者
    CFRunLoopAddObserver(runloop, runloopObserver, kCFRunLoopCommonModes);
    //释放内存
    CFRelease(runloop);
}

-(void)addTask:(CHGRunloopTaskBlock)task {
    [self.tasks addObject:task];
    //如果任务超过18个则移除第一个任务
    //    NSLog(@"任务数量:%li",self.tasks.count);
    if (self.tasks.count > self.maxTask) {
        [self.tasks removeObjectAtIndex:0];
    }
}

-(void)removeTask:(CHGRunloopTaskBlock)task {
    [self.tasks removeObject:task];
}

//
void CHG_callBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    //执行task任务
    CHGTaskManager * manager = (__bridge CHGTaskManager *)(info);
    if (manager.tasks.count == 0) {
        return;
    }
    CHGRunloopTaskBlock task = manager.tasks.firstObject;
    task();
    [manager.tasks removeObjectAtIndex:0];//第一个任务执行完毕后将任务移除
    //    NSLog(@"移除一个任务后 任务数量:%li",manager.tasks.count);
    if (manager.tasks.count == 0) {
        [manager.timer invalidate];
    }
}

- (NSMutableArray *)tasks {
    if (!_tasks) {
        _tasks = [NSMutableArray array];
    }
    return _tasks;
}

- (void)dealloc
{
    //    NSLog(@"---------------------CHGTaskManager end------------------------------");
}

@end
