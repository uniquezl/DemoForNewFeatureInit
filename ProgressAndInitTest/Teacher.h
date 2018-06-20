//
//  Teacher.h
//  ProgressAndInitTest
//
//  Created by zhulin on 2018/6/1.
//  Copyright © 2018年 zhulin. All rights reserved.
//


#import "People.h"

@interface Teacher : People 
{
NSString * _career;
}

- (instancetype)initWithName:(NSString *)name andCareer:(NSString *)career NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCareer:(NSString *)career __attribute__((objc_requires_super));

//@property (nonatomic, copy)NSString * name __attribute__((availability(ios,introduced=3_0,deprecated=10_0,obsoleted=12_0,message="3")));

@end
