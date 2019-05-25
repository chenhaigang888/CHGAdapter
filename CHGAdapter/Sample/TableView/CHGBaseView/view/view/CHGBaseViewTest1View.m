//
//  CHGBaseViewTest1View.m
//  CHGAdapter
//
//  Created by DNAER5 on 2019/5/25.
//  Copyright © 2019 chen haiGang. All rights reserved.
//

#import "CHGBaseViewTest1View.h"
#import "CHGBaseViewTest2View.h"

@interface CHGBaseViewTest1View()

///
@property (nonatomic, strong) UILabel * title;
///
@property (nonatomic, strong) CHGBaseViewTest2View * view2;

@end

@implementation CHGBaseViewTest1View

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.title];
        [self addSubview:self.view2];
        self.title.frame = CGRectMake(0, 0, frame.size.width/2, frame.size.height);
        self.view2.frame = CGRectMake(frame.size.width/2, 0, frame.size.width/2, frame.size.height);
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addSubview:self.title];
        [self addSubview:self.view2];
        self.title.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width/2, 44);
        self.view2.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width/2, 0, UIScreen.mainScreen.bounds.size.width/2, 44);
    }
    return self;
}

- (UILabel *)title {
    if (!_title) {
        _title = [UILabel new];
        _title.text = @"我是文本内容";
        _title.textColor = UIColor.redColor;
        _title.textAlignment = NSTextAlignmentCenter;
    }
    return _title;
}

- (CHGBaseViewTest2View *)view2 {
    if (!_view2) {
        _view2 = [CHGBaseViewTest2View new];
    }
    return _view2;
}

- (void)cellForRowAtIndexPath:(NSIndexPath *)indexPath targetView:(UIView *)targetView withData:(id)data {
    [super cellForRowAtIndexPath:indexPath targetView:targetView withData:data];
}

- (void)cellWillAppear {
    [super cellWillAppear];
}

- (void)cellDidDisappear {
    [super cellDidDisappear];
    
}

@end
