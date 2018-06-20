//
//  MathTeacher.m
//  ProgressAndInitTest
//
//  Created by zhulin on 2018/6/1.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import "MathTeacher.h"

@implementation MathTeacher


- (instancetype)initMath
{
    //self = [self initWithName:@"ZL" andCareer:@"Math"];
    self = [super initWithName:@"ZL" andCareer:@"Math"];
    if (self)
    {
        _age = 28;
    }
    return self;
}

- (id)initWithName:(NSString *)name andCareer:(NSString *)career
{
    //self = [super initWithName:@"a" andCareer:@"asdf"];
    return [self initMath];
}
//- (instancetype)initWithCareer:(NSString *)career
//{
//    return [self initMath];
//}
- (void)testForNonNull:(NSString *)name
{
    
}

-(NSString *)description
{
    
    return [NSString stringWithFormat:@"name:%@,age:%ld,career:%@",_name,_age,_career];
    
    
}
@end
