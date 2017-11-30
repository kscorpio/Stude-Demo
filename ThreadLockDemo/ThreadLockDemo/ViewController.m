//
//  ViewController.m
//  ThreadLockDemo
//
//  Created by kscorpio on 2017/11/30.
//  Copyright © 2017年 kscorpio. All rights reserved.
//

#import "ViewController.h"

#import "LockTest.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
      LockTest * test=[[LockTest alloc]init];
    
    
    //! testSynchronized
     //![test testSynchronized];
    
    
    //! testNSLock
    //![test testNSLock];
    
    
    //! testSemaphore
     [test testSemaphore];
   
    
    
 
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
