//
//  NonCatainerTest.h
//  CopyTestDemo
//
//  Created by kscorpio on 2017/11/30.
//  Copyright © 2017年 kscorpio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestCase : NSObject
// 非集合 不可变
+(void)nonCatainerUnMutableTest;
// 非集合 可变
+(void)nonCatainerMutableTest;
// 集合 不可变
+(void)catainerUnmutableTest;
// 集合 可变
+(void)catainerMutableTest;
@end
