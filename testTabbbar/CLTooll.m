//
//  CLTooll.m
//  testTabbbar
//
//  Created by 陈列 on 2018/11/13.
//  Copyright © 2018年 陈列. All rights reserved.
//

#import "CLTooll.h"
#import <objc/runtime.h>

@implementation CLTooll



+(CLTooll *)shareCLTooll{
    
    static CLTooll *shareTooll;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        shareTooll=[[self alloc] init];
    });
    
    return shareTooll;
}
/**
 *  获取 类的属性。
 *
 *  @param class 传入的类，其他类的属性方法类似
 *
 *  @return 返回存放属性的数组
 */
+ (NSArray *)getClassAttribute:(id)class
{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([class class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for(int i = 0; i < count; i++)
    {
        /*
         //  分步取属性
         objc_property_t property = properties[i];
         NSString *name = [NSString stringWithUTF8String:property_getName(property)];
         NSString *attributes = [NSString stringWithUTF8String:property_getAttributes(property)];
         NSLog(@"name0000:%@",name);
         NSLog(@"attributes0000:%@",attributes);
         */
        const char  *propertyName = property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String:propertyName]];
    }
    free(properties);
    return propertiesArray;
}


@end
