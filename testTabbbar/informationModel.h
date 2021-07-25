//
//  informationModel.h
//  testTabbbar
//
//  Created by 陈列 on 2018/11/12.
//  Copyright © 2018年 陈列. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface informationModel : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *education;
@property(nonatomic,strong) NSString *mobile;
@property(nonatomic,strong) NSString *address;


- (NSArray *) allPropertyNames;



@end



NS_ASSUME_NONNULL_END
