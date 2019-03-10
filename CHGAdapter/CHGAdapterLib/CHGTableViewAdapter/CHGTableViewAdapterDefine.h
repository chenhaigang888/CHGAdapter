//
//  CHGTableViewAdapterDefine.h
//  CHGAdapter
//
//  Created by chen haiGang on 2018/5/10.
//  Copyright © 2018年 chen haiGang. All rights reserved.
//

#ifndef CHGTableViewAdapterDefine_h
#define CHGTableViewAdapterDefine_h



typedef id(^CHGCallBack)(id data);

/**
 事件传输block

 @param target 当前事件发生的场所（一般是cell、header、footer、adapter中）
 @param params 事件发生的场所传递出来的参数
 @param tag 区分事件发生的场所中的多个事件
 @param callBack 当当前类中处理完事件后异步通知事件所发生的场所
 @return 当当前类中处理完事件后同步步通知事件所发生的场所
 */
typedef id(^CHGEventTransmissionBlock)(id target,id params, NSInteger tag,CHGCallBack callBack);

#endif /* CHGTableViewAdapterDefine_h */
