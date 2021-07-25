//
//  SaveDistriModel.h
//  Collection
//
//  Created by 陈列 on 2019/6/3.
//  Copyright © 2019年 cl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SvDistributionInfoEntity : NSObject
@property(nonatomic,copy)NSString *svTypeId    ;//    实地走访类型id
@property(nonatomic,copy)NSString *svId    ;//    走访id
@property(nonatomic,copy)NSString *svUserId    ;//    走访人员Id
@property(nonatomic,copy)NSString *svSummary    ;//    走访总结
@end

NS_ASSUME_NONNULL_END
