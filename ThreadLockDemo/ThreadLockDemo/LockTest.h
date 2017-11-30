//
//  LockTest.h
//  ThreadLockDemo
//
//  Created by kscorpio on 2017/11/30.
//  Copyright © 2017年 kscorpio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LockTest : NSObject
-(void)testSynchronized;

- (void)testNSLock;


- (void)testSemaphore;
@end
