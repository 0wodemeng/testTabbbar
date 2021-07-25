//
//  GTools.h
//  Caafc
//
//  Created by sunjz on 2018/1/19.
//  Copyright © 2018年 caafc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"
@interface GTools : NSObject

//label
+(UILabel *)makeLabelWithFrame:(CGRect) rect options:(NSDictionary *)options;
+ (void)configureLabel:(UILabel*)label withFont:(CGFloat)fontSize withTextColor:(UIColor*)color;

+ (void)configureButton:(UIButton*)button addTarget:(id)target WithAction:(SEL)sel withFont:(CGFloat)fontSize withTextColor:(UIColor*)textColor withTitle:(NSString*)title withBackColor:(UIColor*)backColor;

+ (void)showLoad;
+ (void)hideLoad;
+ (void)showInfoMessage:(NSString *)message AfterDelay:(CGFloat)delay;
+ (void)showInfoMessage:(NSString *)message addTarget:(id)target Action:(SEL)action AfterDelay:(CGFloat)delay;
+ (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV;
+(int)compareOneDay:(NSDateComponents *)oneComponents withAnotherDay:(NSDateComponents *)anotherComponents;
+ (int )differencewithDate:(NSString*)dateString withDate:(NSString*)anotherdateString;
+(NSString *)changeNumberFormat:(NSString *)num;
+ (CGFloat)cellHeightWithMsg:(NSString *)msg font:(CGFloat )font Width:(CGFloat )width;
+(NSString *)moneyFormat:(NSNumber *)text;
@end
