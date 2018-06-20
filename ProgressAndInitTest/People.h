//
//  People.h
//  ProgressAndInitTest
//
//  Created by zhulin on 2018/6/1.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import <Foundation/Foundation.h>

//__attribute__((objc_subclassing_restricted))
@interface People : NSObject
{

NSString * _name;
}

- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;

- (void)play __attribute__((objc_requires_super));


@end
