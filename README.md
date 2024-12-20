# SysMini: A Framework for Integrating SysML v2 and Domain-Specific Languages

![LOGO](https://github.com/Ruizhe-Yang/SysMini/blob/main/logo.png)
![SysMini Architecture](https://github.com/Ruizhe-Yang/SysMini/blob/main/SysMini%20architecture.png)

## 已完成的关键节点

- VehicleDefinitions样例实现
- emf、etl、egl的主体架构定型
- 实现了大部分语法的映射

## 当前存在的若干问题

### 未完成的工作

- 若干Usage的一类多用未处理
- 若干Membership实例化情况未确定
- 整个Expression转换未实现
- 一次性对一个文件夹进行转换的代码未实现
- PrefixMetadata问题未处理
- TransitionUsage目前关闭
- 全类校对
- 全架构JAVA驱动实现

### 未解决的BUG

- 部分featureSpecialization未转换问题
- 部分MultiplicityRange转换错误问题
- 部分幽灵ReferenceUsage生成问题
- 两个意外的PerformActionUsage生成问题
