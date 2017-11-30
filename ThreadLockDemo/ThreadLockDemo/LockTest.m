//
//  LockTest.m
//  ThreadLockDemo
//
//  Created by kscorpio on 2017/11/30.
//  Copyright © 2017年 kscorpio. All rights reserved.
//

#import "LockTest.h"
@interface LockTest(){
 dispatch_semaphore_t semaphore;
    
}
@property(nonatomic,strong)NSLock * lock;
@end

@implementation LockTest
#pragma mark -  Synchronized Lock
- (void)testSynchronized{
    //!
    //!  两次调用Gcd 执行上锁代码， 第一次执行后，睡眠5s
    //!     Test Synchronized 1 prepare
    //!     Test Synchronized 2 prepare
    //!     Synchronized Case 1 Run
    //!     Synchronized Case 2 Run
    //!     Test Synchronized 1 end
    //!     Test Synchronized 2 end
     dispatch_async(dispatch_get_global_queue(0,DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
         NSLog(@"Test Synchronized 1 prepare");
         [self SynchronizedCase:@"1" wait:5];
         NSLog(@"Test Synchronized 1 end");
     });
    
    dispatch_async(dispatch_get_global_queue(0,DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        NSLog(@"Test Synchronized 2 prepare");
        [self SynchronizedCase:@"2" wait:0];
        NSLog(@"Test Synchronized 2 end");
    });
}

-(void)SynchronizedCase:(NSString *)mark wait:(int)ifwait{
    @synchronized(self) {
        NSLog( @"Synchronized Case %@ Run",mark );
        if (ifwait>=0) {
            if (ifwait <10) {
             sleep(ifwait);
            }else{
             sleep(8);
            }
        }
    }
}
#pragma mark -   NSLock
- (void)testNSLock{
    //!
    //!  NSLock中实现了一个简单的互斥锁
    //!     Test NSLock 1 prepare
    //!     Test NSLock 2 prepare
    //!         NSLock Case 1 Run
    //!         NSLock Case 2 Run
    //!     Test NSLock 1 end
    //!     Test NSLock 2 end
    if (_lock ==nil) {
        _lock=[[NSLock alloc]init];
    }
    dispatch_async(dispatch_get_global_queue(0,DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        NSLog(@"Test NSLock 1 prepare");
        [self NSLockCase:@"1" wait:5];
        NSLog(@"Test NSLock 1 end");
    });
    
    dispatch_async(dispatch_get_global_queue(0,DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        NSLog(@"Test NSLock 2 prepare");
        [self NSLockCase:@"2" wait:0];
        NSLog(@"Test NSLock 2 end");
    });
}

-(void)NSLockCase:(NSString *)mark wait:(int)ifwait{
    @synchronized(self) {
        NSLog( @"NSLock Case %@ Run",mark );
        if (ifwait>=0) {
            if (ifwait <10) {
                sleep(ifwait);
            }else{
                sleep(8);
            }
        }
    }
}
#pragma mark -  semaphore
- (void)testSemaphore{
    //!
    //!  semaphore中实现了一个简单的互斥锁 semaphore设为2
    //!     Test Semaphore 2 prepare
    //!     Test Semaphore 1 prepare
    //!     Test Semaphore 3 prepare
    //!         Semaphore Case 2 Run    立即执行 semaphore=2 -> 1
    //!         Semaphore Case 1 Run    立即执行 semaphore=1 -> 0
    //!
    //!     Test Semaphore 2 end        semaphore= 0 -> 1
    //!          Semaphore Case 3 Run   semaphore= 1 -> 0
    //!     Test Semaphore 1 end        semaphore= 0 -> 1
    //!     Test Semaphore 3 end        semaphore= 1 -> 2
    if (semaphore ==nil) {
        semaphore=dispatch_semaphore_create(2);;
    }
    dispatch_async(dispatch_get_global_queue(0,DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        NSLog(@"Test Semaphore 1 prepare  %@",[NSThread currentThread]);
        [self SemaphoreCase:@"1" wait:3];
        NSLog(@"Test Semaphore 1 end");
    });
    dispatch_async(dispatch_get_global_queue(0,DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        NSLog(@"Test Semaphore 2 prepare  %@",[NSThread currentThread]);
        [self SemaphoreCase:@"2" wait:3];
        NSLog(@"Test Semaphore 2 end");
    });
    dispatch_async(dispatch_get_global_queue(0,DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        NSLog(@"Test Semaphore 3 prepare  %@",[NSThread currentThread]);
        [self SemaphoreCase:@"3" wait:0];
        NSLog(@"Test Semaphore 3 end");
    });
}

-(void)SemaphoreCase:(NSString *)mark wait:(int)ifwait{
    NSLog(@"   ");
   dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog( @"Semaphore Case %@ Run",mark );
        if (ifwait>=0) {
            if (ifwait <10) {
                sleep(ifwait);
            }else{
                sleep(8);
            }
        }
    /**
     *  发送一个信号通知，这时候信号量+1，为1
     */
    dispatch_semaphore_signal(semaphore);
}
#pragma mark -
#pragma mark -
#pragma mark -
#pragma mark -
#pragma mark -
@end
