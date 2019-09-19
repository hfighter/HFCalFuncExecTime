//
//  HFCalFuncExecTime.m
//
//  Created by hui hong on 2019/9/18.
//  Copyright © 2019 hfighter. All rights reserved.
//

#import "HFCalFuncExecTime.h"

@interface HFCalFuncExecTime()

@property (nonatomic, strong) NSMutableArray *times;
@property (nonatomic, assign) NSTimeInterval total;

@end

@implementation HFCalFuncExecTime

- (instancetype)init {
    self = [super init];
    if (self) {
        _times = [NSMutableArray new];
        _total = 0;
    }
    return self;
}

+ (instancetype)sharedInstance {
    static HFCalFuncExecTime *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!shared) {
            shared = [HFCalFuncExecTime new];
        }
    });
    return shared;
}

- (void)execFunc:(dispatch_block_t)block withDesc:(NSString *)desc {
    if (!block) {
        return;
    }
    NSTimeInterval begin = CFAbsoluteTimeGetCurrent();
    block();
    NSTimeInterval end = CFAbsoluteTimeGetCurrent();
    self.total += (end - begin)*1000;
    NSString *str = [NSString stringWithFormat:@"%@ : %@ms", desc ? desc : @"", @((end - begin)*1000)];
    [self.times addObject:str];
}

- (void)reset {
    [self.times removeAllObjects];
    self.total = 0;
}

- (void)print {
    NSLog(@"----- func exec time ---------");
    NSLog(@"%@", self.times);
    NSLog(@"total times is %@", @(self.total));
    NSLog(@"----- func exec time ---------");
}

@end
