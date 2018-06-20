//
//  People.m
//  ProgressAndInitTest
//
//  Created by zhulin on 2018/6/1.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import "People.h"

@implementation People

- (instancetype)initWithName:(NSString *)name
{
    if (self = [super init])
    {
        _name = name;
    }
    return self;
}

- (instancetype)init
{
    
   return [self initWithName:@"people"];
}
@end
