//
//  ViewController.m
//  ThreadLockDemo
//
//  Created by kscorpio on 2017/11/30.
//  Copyright © 2017年 kscorpio. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
//#import "LockTest.h"
@interface ViewController ()
@property(nonatomic,strong)NSString * testStr;
@end
static NSString * const ab=@"";
struct{
    unsigned int a:1;
} _delegateFlag;

@implementation ViewController
@synthesize testStr=mtest;
+(void)load{
   NSLog(@" ViewController  load ");
}
+ (void)initialize
{
    if (self == [ViewController class]) {
        NSLog(@" ViewController  initialize ");
    }
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@" ViewController  init ");
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     //！ LockTest * test=[[LockTest alloc]init];
    
     
    //! testSynchronized
    //![test testSynchronized];
    
    
    //! testNSLock
    //![test testNSLock];
    
    
    //! testSemaphore
     //！∂[test testSemaphore];
    
    
    //！ [test testPthread_mutex];
   
   //！  [test testNSConditionLock];
   
    
    //！[test testNSRecursiveLock];
    NSArray * arr=@[@1,@2,@3,@4,@1,@2,@3,@4,@1,@2,@3,@4,@1,@2,@3,@4];
    
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@" ---   %@   idx : %zd  stop  %zd",obj,idx,stop);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)description{
    return [NSString stringWithFormat:@"111  %@",@"a"];
}

+ (NSString *)newStr{
    NSString * str=[[NSString alloc]initWithFormat:@"str1"];
    return str;
}
+ (NSString *)someStr{
    NSString * str=[[NSString alloc]initWithFormat:@"str2"];
    return str;
}


@end
