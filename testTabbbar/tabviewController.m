//
//  tabviewController.m
//  testTabbbar
//
//  Created by 陈列 on 2018/7/30.
//  Copyright © 2018年 陈列. All rights reserved.
//

#import "tabviewController.h"
#import "ONEViewController.h"
#import "TWOViewController.h"
#import "Base64codeFunc.h"
@interface tabviewController ()

@end

@implementation tabviewController

- (NSString *)hexStringFromString:(NSString *)string{
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}

// 十六进制转换为普通字符串的。
- (NSString *)stringFromHexString:(NSString *)hexString {
    
    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
    NSLog(@"------字符串=======%@",unicodeString);
    return unicodeString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    NSLog(@"encode --__BASE64>%@",__BASE64(@"HOUWJ"));
//     NSLog(@"decode -->%@",__TEXT([self stringFromHexString:@"356F5237755372367178553D"]));
    
    NSLog(@"");
    
//    NSLog(@"decode -->%@",__TEXT(@"sZyfNDXtdmo="));
    
    NSLog(@"");

    
    
    

    NSLog(@"5oR7uSr6qxU= 356F5237755372367178553D");
    NSLog(@"");

    
    
    

//    NSLog(@"decode -->%@",[Base64codeFunc decryptWithText:@"U6HgFLsVpwU="]);
   
    
    
       NSLog(@"");
      NSLog(@"encode --encode>%@",[Base64codeFunc encode:@"HOUWJ"]);
    
    
    NSLog(@"");
    
    NSLog(@"encode --encryptWithText>%@",[Base64codeFunc encryptWithText:@"HOUWJ"]);
    
    
    
    NSLog(@"");
    NSLog(@"encode --encrypt>%@",[Base64codeFunc encrypt:@"HOUWJ"]);
    
    NSLog(@"Decode --decrypt>%@",[Base64codeFunc decrypt:[self stringFromHexString:@"534D7373533542506D36574C4B733442486A423258416943714E7258386A4C4F51356D4C6449554D72476473665374505035412B2F42474155796B46734B745A4B2B4A6A54594659666D424A6779714C646C54515879317A73785231324D5A6E7A6A47735455722B6552516459756E334533752B654E2B75387673736E734B7655713269486E583259546878526D4D4F4144646944706D334250686A3575552B334F635356426A316E3943775939346C4A6E4E714D413D3D"]]);
    
//    534D7373533542506D36574C4B733442486A423258416943714E7258386A4C4F51356D4C6449554D72476473665374505035412B2F42474155796B46734B745A4B2B4A6A54594659666D424A6779714C646C54515879317A73785231324D5A6E7A6A47735455722B6552516459756E334533752B654E2B75387673736E734B7655713269486E583259546878526D4D4F4144646944706D334250686A3575552B334F635356426A316E3943775939346C4A6E4E714D413D3D
    
    
    
    ONEViewController *oc=[[ONEViewController alloc] init];
//    oc.hidesBottomBarWhenPushed=YES;
    TWOViewController *tc=[[TWOViewController alloc] init];
    
//    UINavigationController *oneN=[[UINavigationController alloc] initWithRootViewController:oc];
//    UINavigationController *twoN=[[UINavigationController alloc] initWithRootViewController:tc];
    oc.title=@"ONE";
    tc.title=@"TWO";
    
//    NSArray *VCaRRAY=[NSArray arrayWithObjects:oneN,twoN, nil];
    NSArray *VCaRRAY=[NSArray arrayWithObjects:oc,tc, nil];

    self.viewControllers=VCaRRAY;
    
    UITabBarItem *tab0Item = [self.tabBar.items objectAtIndex:0];
    
    UITabBarItem *tab1Item = [self.tabBar.items objectAtIndex:1];
    
//    [tab0Item setTitle:@"tab0"];
//    [tab1Item setTitle:@"tab1"];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",[self decimalwithFormat:@"0.00" floatV:1.2351]);
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:format];
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
}
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [self.tabBarController.tabBar setHidden:NO];
//}
//
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    [self.tabBarController.tabBar setHidden:YES];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
