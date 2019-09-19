# HFCalFuncExecTime
统计OC和Swift方法和代码块的执行时间

### 使用方法

#### 1、统计
```Objective-C
[HFCalFuncExecTime.sharedInstance execFunc:^{
        ......
        // 需要统计的代码块或者方法
    } withDesc:@"xxxxx描述统计的模块"];
```

#### 2、打印统计的时长
```Objective-C
[HFCalFuncExecTime.sharedInstance print];
```
