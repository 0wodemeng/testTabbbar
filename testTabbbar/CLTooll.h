//
//  CLTooll.h
//  testTabbbar
//
//  Created by 陈列 on 2018/11/13.
//  Copyright © 2018年 陈列. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLTooll : NSObject

+(CLTooll *)shareCLTooll;
+(NSArray *)getClassAttribute:(id)class;
@end

NS_ASSUME_NONNULL_END
