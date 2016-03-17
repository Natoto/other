//
//  CountDownButton.m
//  CountdownButtonDemo
//
//  Created by hb on 15/6/23.
//  Copyright (c) 2015年 pengpeng. All rights reserved.
//

#import "CountDownButton.h"
@interface CountDownButton()
{
    dispatch_source_t _timer;
}
@end
@implementation CountDownButton

-(void)startCountDown
{
    //    if (!self.enabled) {
    //        return;
    //    }
    self.enabled = NO;
    __block int timeout= 60 ; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            _timer = nil;            
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:@"发送验证码" forState:UIControlStateNormal];
                self.enabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.d秒后重新获取",seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                
                [self setTitle:strTime forState:UIControlStateNormal];
                [self setTitle:strTime forState:UIControlStateDisabled];
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
}

-(void)dealloc
{
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
}

@end
