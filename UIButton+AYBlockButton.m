//
//  UIButton+AYBlockButton.m
//  dyldTest
//
//  Created by shanbay410 on 2018/4/17.
//  Copyright © 2018年 shanbay410. All rights reserved.
//

#import "UIButton+AYBlockButton.h"
#import <objc/runtime.h>

static void *ay_blockKey = &ay_blockKey;

@implementation UIButton (AYBlockButton)

#pragma mark - runtime为UIButton 添加属性

- (AY_ButtonEventsBlock)ay_buttonEventsBlock {
    return objc_getAssociatedObject(self, &ay_blockKey);
}

- (void)setAy_buttonEventsBlock:(AY_ButtonEventsBlock)ay_buttonEventsBlock {
    objc_setAssociatedObject(self, &ay_blockKey, ay_buttonEventsBlock, OBJC_ASSOCIATION_COPY);
}

#pragma mark - custom Methods
- (void)ay_addEventHandler:(void (^)(void))block forControlEvents:(UIControlEvents)controlEvents {
    self.ay_buttonEventsBlock = block;
    [self addTarget:self action:@selector(ay_blcokButtonClicked) forControlEvents:controlEvents];
}

#pragma mark - private Methods
- (void)ay_blcokButtonClicked {
    !self.ay_buttonEventsBlock ?: self.ay_buttonEventsBlock();
}

@end

