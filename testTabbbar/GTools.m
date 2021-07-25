//
//  GTools.m
//  Caafc
//
//  Created by sunjz on 2018/1/19.
//  Copyright © 2018年 caafc. All rights reserved.
//

#import "GTools.h"

@implementation GTools

+ (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:format];
    
//    NSLog(@"floatV %f   decimalwithFormat %f  numberFormatter %@",floatV,(floorf(floatV*100 + 0.5))/100,[numberFormatter stringFromNumber:[NSNumber numberWithFloat:(floorf(floatV*100 + 0.5))/100]]);
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:(floorf(floatV*100 + 0.5))/100]];
}

+ (void)configureLabel:(UILabel*)label withFont:(CGFloat)fontSize withTextColor:(UIColor*)color
{
    label.font = [UIFont systemFontOfSize:fontSize];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = color;
    [label sizeToFit];
}


+ (void)configureButton:(UIButton*)button addTarget:(id)target WithAction:(SEL)sel withFont:(CGFloat)fontSize withTextColor:(UIColor*)textColor withTitle:(NSString*)title withBackColor:(UIColor*)backColor{
    button.backgroundColor = backColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateSelected];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateHighlighted];
    [button setTitleColor:textColor forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
}

+(UILabel *)makeLabelWithFrame:(CGRect) rect options:(NSDictionary *)options
{
    UILabel *label = [[UILabel alloc] initWithFrame: rect];
    [self _prepareLabelWithOptions:label options: options];
    return label;
}
+(void)_prepareLabelWithOptions:(UILabel*) label options:(NSDictionary *)options
{
    NSEnumerator *en = [options keyEnumerator];
    id key;
    while (key = [en nextObject]) {
        if ( [key isEqualToString: @"text"]) {
            label.text = [options valueForKey: key];
        } else if ( [key isEqualToString: @"textColor"]) {
            label.textColor = [options valueForKey: key];
        } else if ( [key isEqualToString: @"font"]) {
            label.font = [options valueForKey: key];
        } else if ( [key isEqualToString: @"shadowColor"]) {
            label.shadowColor = [options valueForKey: key];
        }
    }
    label.backgroundColor = [UIColor clearColor];
}

+ (void)showLoad{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}
+ (void)hideLoad{
    [SVProgressHUD dismiss];
    

}


+ (void)showInfoMessage:(NSString *)message AfterDelay:(CGFloat)delay{
    [SVProgressHUD showInfoWithStatus:message];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD dismissWithDelay:delay completion:nil];
    
    
    
    
//    CGFloat height=[GTools cellHeightWithMsg:message font:15.0f Width:AppScreenW/2];
//
//    UIView *backView=[[UIView alloc] initWithFrame:CGRectMake(AppScreenW/4, (AppScreenH-height)/2-50, AppScreenW/2, height+50)];
//    [backView.layer setCornerRadius:5.0f];
//    [backView.layer setMasksToBounds:YES];
////    [backView setBackgroundColor:AppColorFromRGB(0xBBE9FC)];
//    [backView setBackgroundColor:AppColorFromRGB(0xC3C1C3)];
//
//    UILabel *showLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 50, AppScreenW/2, height)];
//    [showLabel setText:message];
////    [showLabel setTextColor:[UIColor grayColor]];
//    [showLabel setTextAlignment:NSTextAlignmentCenter];
//    [showLabel setNumberOfLines:0];
//    [showLabel setFont:[UIFont systemFontOfSize:15.0f]];
//
//
//    UIImageView *imageview=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, AppScreenW/2, 50)];
//    [imageview setContentMode:UIViewContentModeScaleAspectFit];
//    [imageview setImage:[UIImage imageNamed:@"errortishi"]];
//
//
//    [backView addSubview:imageview];
//    [backView addSubview:showLabel];
//
//    [[[[UIApplication sharedApplication] windows] lastObject] addSubview:backView];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [backView removeFromSuperview];
//    });
}

+ (void)showInfoMessage:(NSString *)message addTarget:(id)target Action:(SEL)action AfterDelay:(CGFloat)delay{
    dispatch_time_t dipatchTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
    dispatch_after(dipatchTime, dispatch_get_main_queue(), ^{
        if ([target respondsToSelector:action]) {
//            [target performSelector:action withObject:nil afterDelay:delay];
             [target performSelector:action withObject:nil];
        }

    });
    [SVProgressHUD showInfoWithStatus:message];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD dismissWithDelay:delay completion:nil];
    
}

+(int)compareOneDay:(NSDateComponents *)oneComponents withAnotherDay:(NSDateComponents *)anotherComponents

{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    NSDate *oneDay=[calendar dateFromComponents:oneComponents];
    NSDate *anotherDay=[calendar dateFromComponents:anotherComponents];

    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    
    NSComparisonResult result = [dateA compare:dateB];
    
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    
    if (result == NSOrderedDescending) {
        
        //NSLog(@"Date1  is in the future");
        
        return 1;
        
    }
    
    else if (result ==NSOrderedAscending){
        
        //NSLog(@"Date1 is in the past");
        
        return -1;
        
    }
    
    //NSLog(@"Both dates are the same");
    
    return 0;
    
    
    
}
+ (int )differencewithDate:(NSString*)dateString withDate:(NSString*)anotherdateString{
        
        
        
        NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
        
        //    [formatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
        
        [formatter setDateFormat:@"yyyyMMdd "];
        
        NSDate  *date2 = [formatter dateFromString :dateString];
        
        NSDate  *date1 = [formatter dateFromString :anotherdateString];
        
        //     NSLog(@"------date1=%@   date2=%@------%@",date1, date2);
        
        NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
        
        unsigned int unitFlags =NSDayCalendarUnit;//年、月、日、时、分、秒、周等等都可以
        
        NSDateComponents *comps = [gregorian components:unitFlags fromDate:date1 toDate:date2 options:0];
        
        int day = [comps day];//时间差
        
//        NSLog(@"时间差 = %d，abs(month)=%d",month,abs(month));
        
        return day;
        
    }
- (NSString *)positiveFormat:(NSString *)text{
    if(!text || [text floatValue] == 0){
        return @"0.00";
    }
    if (text.floatValue < 1000) {
        return  [NSString stringWithFormat:@"%.2f",text.floatValue];
    };
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@",###.00;"];
    return [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[text doubleValue]]];
}

+(NSString *)changeNumberFormat:(NSString *)text{
    
    if(!text || [text floatValue] == 0){
        return @"0.00";
    }
    if (text.floatValue < 1000) {
        return  [NSString stringWithFormat:@"%.2f",text.floatValue];
    };
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@",###.00;"];
    return [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[text doubleValue]]];
    
 
    
}

+(NSString *)moneyFormat:(NSString *)text{
    if (![text isKindOfClass:[NSString class]]) {
        text = [NSString stringWithFormat:@"%@",text];
    }
    if(!text || [text floatValue] == 0){
        return @"0.00";
    }
    if (text.floatValue < 1000) {
        return  [NSString stringWithFormat:@"%.2f",text.floatValue];
    };
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@",###.00;"];
    return [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[text doubleValue]]];
    
    
    
}
+ (CGFloat)cellHeightWithMsg:(NSString *)msg font:(CGFloat )font Width:(CGFloat )width
{
    UILabel *label = [[UILabel alloc] init];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:font];
    label.numberOfLines = 0;
    CGSize size = [label sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)];
    return size.height;
}




@end
