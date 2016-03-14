//
//  LoginModel.h
//  hjb
//
//  Created by zeno on 16/3/11.
//  Copyright © 2016年 peng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  RACCommand;

@interface LoginModel : NSObject

@property(nonatomic,strong) NSString * username;
@property(nonatomic,strong) NSString * password;
/// The command of login button.
@property (nonatomic, strong, readonly) RACCommand *loginCommand;
@end
