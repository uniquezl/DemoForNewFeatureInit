//
//  ViewController.m
//  ProgressAndInitTest
//
//  Created by zhulin on 2018/6/1.
//  Copyright © 2018年 zhulin. All rights reserved.
//

#import "ViewController.h"
#import "MathTeacher.h"
@compatibility_alias aliasTeacher Teacher;

@interface ViewController ()

@property (nonatomic, strong)NSProgress * progress;
@property (nonatomic, strong)UIProgressView * progressView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MathTeacher * teacher1 = [[MathTeacher alloc] initMath];
    NSLog(@"teacher1:%@",teacher1);
    [teacher1 testForNonNull:nil];


    
    MathTeacher * teacher2 = [[MathTeacher alloc] initWithName:@"zhulin" andCareer:nil];
    NSLog(@"teacher2:%@",teacher2);
    
    MathTeacher * teacher3 = [[MathTeacher alloc] initWithName:@"xiaohua"];
    NSLog(@"teacher3:%@",teacher3);
    
    MathTeacher * teacher4 = [[MathTeacher alloc] initWithCareer:@"mmmmmm"];
    NSLog(@"teacher4:%@",teacher4);
    
    MathTeacher * teacher5 = [[MathTeacher alloc] init];
    NSLog(@"teacher5:%@",teacher5);
    
    //aliasTeacher * t = [[aliasTeacher alloc] init];

    
    [self setupProgressView];
    
    self.progress = [NSProgress discreteProgressWithTotalUnitCount:10];
    [self.progress addObserver:self forKeyPath:@"fractionCompleted" options:(NSKeyValueObservingOptionNew) context:nil];
    //self.progress.cancellable = YES;

//    [self.progress becomeCurrentWithPendingUnitCount:3];
//    [self printString:@"task1"];
//    //NSLog(@"%@ current progress111", [NSProgress currentProgress]);
//    [self.progress resignCurrent];
//    //NSLog(@"%@ current progress2222", [NSProgress currentProgress]);
////
//    [self.progress becomeCurrentWithPendingUnitCount:7];
//    [self printString:@"task2"];
//    //NSLog(@"%@ current progress333", [NSProgress currentProgress]);
//    [self.progress resignCurrent];
//    //NSLog(@"%@ current progress444", [NSProgress currentProgress]);
    
    NSProgress * progress1 = [NSProgress progressWithTotalUnitCount:20 parent:self.progress pendingUnitCount:5];
    NSProgress * progress2 = [NSProgress progressWithTotalUnitCount:10 parent:self.progress pendingUnitCount:5];
    NSProgress * progress21 = [NSProgress progressWithTotalUnitCount:10 parent:progress2 pendingUnitCount:5];
    NSProgress * progress22 = [NSProgress progressWithTotalUnitCount:5 parent:progress2 pendingUnitCount:5];

    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(task:) userInfo:@{@"sub1" : progress1, @"sub2" : progress2, @"sub21" : progress21, @"sub22" : progress22} repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
-(void)setupProgressView
{
    self.progressView =[[UIProgressView alloc] initWithFrame:CGRectMake(30, 100, 200, 0)];
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 5.0f);
    self.progressView.backgroundColor = UIColor.redColor;
    self.progressView.progressViewStyle = UIProgressViewStyleDefault;
    
    //进度条向前推进之后显示出来的颜色
    self.progressView.progressTintColor = UIColor.greenColor;
    
    //进度条原始颜色
    self.progressView.trackTintColor = UIColor.blueColor;
    [self.progressView addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
    [self.progressView setProgress:0.0f animated:YES];
    
    [self.view addSubview:self.progressView];
    
}

/**
 定时器调用的方法
 */
- (void)task:(NSTimer *)timer
{
    //获取当前的进度
    NSDictionary *userInfo = timer.userInfo;
    NSProgress *sub1 = userInfo[@"sub1"];
    NSProgress *sub2 = userInfo[@"sub2"];
    NSProgress *sub21 = userInfo[@"sub21"];
    NSProgress *sub22 = userInfo[@"sub22"];
    
    
    //当完成量达到总量时停止任务
    if (sub1.completedUnitCount >= sub1.totalUnitCount && sub2.completedUnitCount >= sub2.totalUnitCount) {
        [timer invalidate];
        return;
    }
    //模仿完成1份
    if (sub1.completedUnitCount < sub1.totalUnitCount)
    {
        
        sub1.completedUnitCount += 1;
        NSLog(@"fractioncompleted----%f-----Completed --- %lld, --- sub1 -----completed %lld", self.progress.fractionCompleted, self.progress.completedUnitCount,sub1.completedUnitCount);
    }
    
    
    if (sub2.completedUnitCount < sub2.totalUnitCount)
    {
        if (sub21.completedUnitCount < sub21.totalUnitCount)
        {
            sub21.completedUnitCount++;
        }
        if (sub22.completedUnitCount < sub22.totalUnitCount)
        {
            sub22.completedUnitCount++;
        }

    //打印
        NSLog(@"fractioncompleted----%f-----Completed --- %lld, --- sub2-----completed %lld--- sub21-----completed %lld--- sub22-----completed %lld", self.progress.fractionCompleted, self.progress.completedUnitCount,sub2.completedUnitCount,sub21.completedUnitCount,sub22.completedUnitCount);
        
    }
    self.progressView.progress = self.progress.fractionCompleted;
}

/**
 KVO回调方法
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    //获取观察的新值
//    CGFloat value = [change[NSKeyValueChangeNewKey] doubleValue];
//    //打印
//    NSLog(@"fractionCompleted --- %f, localizedDescription --- %@, localizedAdditionalDescription --- %@, completed : %lld", value, self.progress.localizedDescription, self.progress.localizedAdditionalDescription, self.progress.completedUnitCount);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
