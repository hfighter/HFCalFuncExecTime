//
//  HFCalFuncExecTime.h
//
//  Created by hui hong on 2019/9/18.
//  Copyright © 2019 hfighter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HFCalFuncExecTime : NSObject

+ (instancetype)sharedInstance;
// 将代码块放入block中执行
- (void)execFunc:(dispatch_block_t)block withDesc:(NSString *)desc;
// 重置计时
- (void)reset;
// 打印统计的时间
- (void)print;

@end
