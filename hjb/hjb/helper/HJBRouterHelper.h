//
//  HJBRouterHelper.h
//  hjb
//
//  Created by BooB on 16/3/15.
//  Copyright © 2016年 peng. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface HJBRouterHelper:NSObject
+(void)initHBRouterWithRoot:(UIViewController *)mainNavigationctr;
@end

@interface UIViewController(HJBRouterHelper)
//-(void)addToRouter;
//-(void)addToRouterWithClass:(Class)class;
//-(void)openViewControllerWithClass:(Class)class para:(NSDictionary *)param;
//
//-(void)openURLString:(NSString *)URLString parameters:(NSDictionary *)parameters;


-(void)openURLString:(NSString *)URLString
        forKeyAndNib:(NSString *)key
          parameters:(NSDictionary *)parameters;

-(void)openURLString:(NSString *)URLString
              forkey:(NSString *)key
          parameters:(NSDictionary *)parameters;
@end
