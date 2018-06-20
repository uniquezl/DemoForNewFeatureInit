//
//  MathTeacher.h
//  ProgressAndInitTest
//
//  Created by zhulin on 2018/6/1.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import "Teacher.h"


__attribute__((objc_runtime_name("BearChild"))) //允许编译时将interface或者protocol的名字指定为别的名字。括号里面的就是编译时的名字——代码混淆
@interface MathTeacher : Teacher

@property (nonatomic, assign) NSUInteger age  __attribute__((deprecated("123")));


- (instancetype)initMath NS_DESIGNATED_INITIALIZER;
- (void)testForNonNull:(NSString *)name __attribute__((nonnull));

@end
