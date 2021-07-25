//
//  ViewController.m
//  testTabbbar
//
//  Created by 陈列 on 2018/7/30.
//  Copyright © 2018年 陈列. All rights reserved.
//

#import "ViewController.h"
#import "ONEViewController.h"
#import "TWOViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ONEViewController *oc=[[ONEViewController alloc] init];
    TWOViewController *tc=[[TWOViewController alloc] init];
    
    UINavigationController *oneN=[[UINavigationController alloc] initWithRootViewController:oc];
    UINavigationController *twoN=[[UINavigationController alloc] initWithRootViewController:tc];
    oc.title=@"ONE";
    tc.title=@"TWO";
    
    NSArray *VCaRRAY=[NSArray arrayWithObjects:oc,tc, nil];
    
    self.viewControllers=VCaRRAY;
    
//    NSLog(@"%@",[self decimalwithFormat:@"0.00" floatV:1.236]);
    // Do any additional setup after loading the view, typically from a nib.
    
   
}



- (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:format];
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
