//
//  Teacher.m
//  ProgressAndInitTest
//
//  Created by zhulin on 2018/6/1.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

//@dynamic name;
static NSString * _name = nil;


- (instancetype)initWithName:(NSString *)name andCareer:(NSString *)career
{
    if (self = [super initWithName:name])
    {
        _career = career;
    }
    return self;
}
- (instancetype)initWithCareer:(NSString *)career
{
    //self = [self initWithName:@"my"];
    if (self)
    {
        _career = career;

    }
    
    return self;
}
- (void)play
{
    
}
- (instancetype)initWithName:(NSString *)name 
{
    return [self initWithName:name andCareer:@"Teacher"];
}

+ (NSString *)name
{
    if (_name == nil)
    {
        _name = [[NSString alloc] init];
    }
    return _name;
}

+ (void)setName:(NSString *)newName
{
    if (_name != newName)
    {
        _name = [newName copy];
    }
}
@end
