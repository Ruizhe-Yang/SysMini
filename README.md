# SysMini: A Framework for Integrating SysML v2 and Domain-Specific Languages

![LOGO](https://github.com/Ruizhe-Yang/SysMini/blob/main/logo.png)
![SysMini Architecture](https://github.com/Ruizhe-Yang/SysMini/blob/main/SysMini%20architecture.png)

## 已完成的关键节点

- 单个文件
- emf、etl、egl的主体架构定型
- 大多数转换

### 改动

- KerML2XMI：98、115、116、123、125、（211、213）

## 当前存在的若干问题

### 未完成的工作

- 若干Usage的一类多用未处理
- 若干Membership实例化情况未确定
- TransitionUsage目前关闭
- 存在Import多层引用问题，如501、502行
- 缩写字符问题
- featureSpecialization多个情况下的处理（不太希望动）
- Expression未测试完全
- 全类校对

### 未解决的BUG

- 全架构JAVA驱动实现的问题：当前target platform使用上添加Epsilon会起冲突；EOL可用ETL和EGL不可用
- 一次性对一个文件夹进行转换的代码存在问题，SysML2XMI中的函数一次只能执行一个
- 一些引用会使用缩写，缩写目前无法被检索，如550、551行
- MetadataBodyUsage不对，ReferenceUsage未处理清楚，如240行

### 待确定的情况

- 部分幽灵ReferenceUsage生成问题：可能会随着Usage处理完消除掉
- PortUsage的MultiplicityRange出现位置问题，如624、630行：见xtext的367行，应该问题不大
- 若干意外的PerformActionUsage生成问题：可能是equivalent()调用后未实例化出现的问题，目前又没有了
