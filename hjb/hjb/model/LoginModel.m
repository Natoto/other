//
//  LoginModel.m
//  hjb
//
//  Created by zeno on 16/3/11.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "LoginModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "CacheCenter.h"

@interface LoginModel()
@property (nonatomic, strong, readwrite) RACCommand *loginCommand;
@end

@implementation LoginModel

-(instancetype)init
{
    self = [super init];
    if (self) {
        _username = GET_OBJECT_OF_USERDEFAULT(@"username");
        _password = GET_OBJECT_OF_USERDEFAULT(@"password");
        @weakify(self)
        self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSString *oneTimePassword ) {
            @strongify(self)
            return [self signInAsUse];
        }];
    }
    return self;
}

- (RACSignal *)signInAsUse {
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"%@ %@",self.username,self.password);
        SET_OBJECT_OF_USERDEFAULT(self.username, @"username");
        SET_OBJECT_OF_USERDEFAULT(self.password, @"password");
        [subscriber sendNext:@"请求数据"];
        [subscriber sendCompleted];
        return nil;
    }];
}

@end
