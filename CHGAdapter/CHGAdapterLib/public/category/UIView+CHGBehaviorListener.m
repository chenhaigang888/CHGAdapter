//
//  UIView+CHGBehaviorListener.m
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/25.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "UIView+CHGBehaviorListener.h"
#import <objc/runtime.h>
#import "CHGViewLifeCycleProtocol.h"
#import "CHGTableViewHeaderFooterLifeCycleProtocol.h"
#import "CHGCollectionReusableViewLifeCycleProtocol.h"

@implementation UIView (CHGBehaviorListener)

+ (void)load {
    Method fromeAddSubView = class_getInstanceMethod([self class], @selector(addSubview:));
    Method toInitSwizzlingAddSubView = class_getInstanceMethod([self class], @selector(swizzlingAddSubView:));
    if (!class_addMethod([self class], @selector(swizzlingAddSubView:), method_getImplementation(toInitSwizzlingAddSubView), method_getTypeEncoding(toInitSwizzlingAddSubView))) {
        method_exchangeImplementations(fromeAddSubView, toInitSwizzlingAddSubView);
    }
    
    Method fromeRemoveFromSuperview = class_getInstanceMethod([self class], @selector(removeFromSuperview));
    Method toInitSwizzlingRemoveFromSuperview = class_getInstanceMethod([self class], @selector(swizzlingRemoveFromSuperview));
    if (!class_addMethod([self class], @selector(swizzlingAddSubView:), method_getImplementation(toInitSwizzlingRemoveFromSuperview), method_getTypeEncoding(toInitSwizzlingRemoveFromSuperview))) {
        method_exchangeImplementations(fromeRemoveFromSuperview, toInitSwizzlingRemoveFromSuperview);
    }
}

-(void)swizzlingAddSubView:(UIView*)view {
    [self swizzlingAddSubView:view];
    if([self conformsToProtocol:@protocol(CHGViewLifeCycleProtocol)] && [view conformsToProtocol:@protocol(CHGViewLifeCycleProtocol)]) {
        id<CHGViewLifeCycleProtocol> protocol = (id<CHGViewLifeCycleProtocol>)self;
        [protocol.protocols addObject:view];
    } else if ([self conformsToProtocol:@protocol(CHGTableViewHeaderFooterLifeCycleProtocol)] && [view conformsToProtocol:@protocol(CHGTableViewHeaderFooterLifeCycleProtocol)]) {
        id<CHGTableViewHeaderFooterLifeCycleProtocol> protocol = (id<CHGTableViewHeaderFooterLifeCycleProtocol>)self;
        [protocol.protocols addObject:view];
    } else if ([self conformsToProtocol:@protocol(CHGCollectionReusableViewLifeCycleProtocol)] && [view conformsToProtocol:@protocol(CHGCollectionReusableViewLifeCycleProtocol)]) {
        id<CHGCollectionReusableViewLifeCycleProtocol> protocol = (id<CHGCollectionReusableViewLifeCycleProtocol>)self;
        [protocol.protocols addObject:view];
    }
}

- (void)swizzlingRemoveFromSuperview {
    if ([self.superview conformsToProtocol:@protocol(CHGViewLifeCycleProtocol)] && [self conformsToProtocol:@protocol(CHGViewLifeCycleProtocol)]) {
        id<CHGViewLifeCycleProtocol> protocol = (id<CHGViewLifeCycleProtocol>)self.superview;
        [protocol.protocols removeObject:self];
    } else if ([self.superview conformsToProtocol:@protocol(CHGTableViewHeaderFooterLifeCycleProtocol)] && [self conformsToProtocol:@protocol(CHGTableViewHeaderFooterLifeCycleProtocol)]) {
        id<CHGTableViewHeaderFooterLifeCycleProtocol> protocol = (id<CHGTableViewHeaderFooterLifeCycleProtocol>)self.superview;
        [protocol.protocols removeObject:self];
    } else if ([self.superview conformsToProtocol:@protocol(CHGCollectionReusableViewLifeCycleProtocol)] && [self conformsToProtocol:@protocol(CHGCollectionReusableViewLifeCycleProtocol)]) {
        id<CHGCollectionReusableViewLifeCycleProtocol> protocol = (id<CHGCollectionReusableViewLifeCycleProtocol>)self.superview;
        [protocol.protocols removeObject:self];
    }
    [self swizzlingRemoveFromSuperview];
    
}





@end
