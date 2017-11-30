//
//  NonCatainerTest.m
//  CopyTestDemo
//
//  Created by kscorpio on 2017/11/30.
//  Copyright © 2017年 kscorpio. All rights reserved.
//

#import "TestCase.h"

@implementation TestCase
// 非集合 不可变
+(void)nonCatainerUnMutableTest{
    NSString * str1=@"test 1";
    NSString * str2=[str1 copy];
    NSString * str3=[[NSString alloc]initWithString:str1];
    NSMutableString * str4=[str1 mutableCopy];
    [str4 appendString:@" append"];
    NSLog(@" -------------   非集合 不可变   --------------- " );
    NSLog(@"  str: * %p ->      %p  %@",&str1, str1,  str1);
    NSLog(@" str2: * %p ->      %p  %@",  &str2,str2, str3);
    NSLog(@" str3: * %p ->      %p  %@", &str3,str3,  str3);
    NSLog(@" str4: * %p ->      %p  %@",  &str4,str4, str4);
     NSLog(@" ------------------------------------------- " );
}
// 非集合 可变
+(void)nonCatainerMutableTest{
    NSMutableString *str1 = [NSMutableString stringWithString:@"test 2"];
    NSString * str2=[str1 copy];
    NSMutableString *str3 = [str1 mutableCopy];
    [str1 appendString:@" append"];
    
    NSLog(@" -------------   非集合 可变   --------------- " );
    NSLog(@"  str: * %p ->      %p  %@",&str1, str1,  str1);
    NSLog(@" str2: * %p ->      %p  %@",  &str2,str2, str3);
    NSLog(@" str3: * %p ->      %p  %@", &str3,str3,  str3);
    
    NSLog(@" ------------------------------------------- " );
}
// 集合 不可变
+(void)catainerUnmutableTest{
    NSArray * arr=@[@"0",@[@"a",@"b"],@"c"];
    NSArray * arr1=[arr copy];
    NSMutableArray * arr3=[arr mutableCopy];
    NSMutableArray * arr4=[[NSMutableArray alloc]initWithArray:arr copyItems:YES];
    NSLog(@" -------------   集合 不可变   --------------- " );
    NSLog(@"  arr: * %p ->  %p    [1]: %p    [2]: %p ", &arr,arr,  arr[1], arr[2]);
    NSLog(@" arr1: * %p ->  %p    [1]: %p    [2]: %p ", &arr1,arr1,  arr1[1],arr1[2]);
    NSLog(@" arr3: * %p ->  %p    [1]: %p    [2]: %p ", &arr3,arr3,  arr3[1],arr3[2]);
    NSLog(@" arr4: * %p ->  %p    [1]: %p    [2]: %p ", &arr4,arr4,  arr4[1],arr4[2]);
    NSLog(@" ------------------------------------------- " );
}
// 集合 可变
+(void)catainerMutableTest{
    NSArray * arr=[NSMutableArray  arrayWithArray:@[@"0",@[@"a",@"b"],@"c"]];
    NSArray * arr1=[arr copy];
    NSMutableArray * arr3=[arr mutableCopy];
    
    NSMutableArray * arr4=[[NSMutableArray alloc]initWithArray:arr copyItems:YES];
    NSLog(@" -------------   集合 可变   --------------- " );
    NSLog(@"  arr: * %p ->  %p    [1]: %p    [2]: %p ", &arr,arr,  arr[1], arr[2]);
    NSLog(@" arr1: * %p ->  %p    [1]: %p    [2]: %p ", &arr1,arr1,  arr1[1],arr1[2]);
    NSLog(@" arr3: * %p ->  %p    [1]: %p    [2]: %p ", &arr3,arr3,  arr3[1],arr3[2]);
    NSLog(@" arr4: * %p ->  %p    [1]: %p    [2]: %p ", &arr4,arr4,  arr4[1],arr4[2]);
    
    NSLog(@" ------------------------------------------- " );
}

@end
