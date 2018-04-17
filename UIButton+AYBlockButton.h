//
//  UIButton+AYBlockButton.h
//  dyldTest
//
//  Created by shanbay410 on 2018/4/17.
//  Copyright © 2018年 shanbay410. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AY_ButtonEventsBlock)(void);

@interface UIButton (AYBlockButton)

/** 事件回调的block */
@property (nonatomic, copy) AY_ButtonEventsBlock ay_buttonEventsBlock;

/**
 给按钮绑定事件回调block
 
 @param block 回调的block
 @param controlEvents 回调block的事件
 */
- (void)ay_addEventHandler:(void(^)(void))block forControlEvents:(UIControlEvents)controlEvents;

@end
