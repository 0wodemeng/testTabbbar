//
//  TWOViewController.m
//  testTabbbar
//
//  Created by 陈列 on 2018/7/30.
//  Copyright © 2018年 陈列. All rights reserved.
//

#import "TWOViewController.h"
#import "THIRDViewController.h"
#import "ReactiveObjC.h"
#import "FOURViewController.h"
#import "testBaseView.h"
#import "SvDistributionInfoEntity.h"
#import "MJExtension.h"

@interface TWOViewController ()

@end

@implementation TWOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor brownColor]];
    
    UIButton *Button=[UIButton buttonWithType:UIButtonTypeCustom];
    [Button setBackgroundColor:[UIColor redColor]];
    [Button setFrame:CGRectMake(100, 100, 100, 100)];
    [Button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:Button];
    
    testBaseView *vew=[[testBaseView alloc] initWithFrame:CGRectMake(0, 200, 100, 100)];
    [self.view addSubview:vew];
    
    
    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    NSMutableArray *paramArray=[NSMutableArray new];
    
    for (int i=0; i<4; i++) {
        SvDistributionInfoEntity *se=[SvDistributionInfoEntity new];
        se.svId=@"3456789567";
        se.svTypeId=@"asdjfs";
        se.svUserId=@"5678";
        se.svSummary=@"阿斯蒂芬";
        
        NSDictionary *dic = [se mj_keyValues];
        
        NSError *parseError = nil;
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
        
//        NSString *temString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
      
        
        
//        NSData *dataPar = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
        NSString *temString = [self objectToJson:dic];
        [paramArray addObject:temString];
    }
//    NSError *error;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:paramArray options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [self objectToJson:paramArray];
    
     NSMutableString * str3 = [[NSMutableString alloc]initWithString:jsonString];
    
    
    
    [str3 replaceOccurrencesOfString:@"\\" withString:@"" options:1 range:NSMakeRange(0, str3.length)];
    
    NSLog(@"jsonString %@",str3 );
          
}
-(NSString *)objectToJson:(id)obj{
    if (obj == nil) {
        return nil;
    }
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj
                                                       options:0
                                                         error:&error];
    
    if ([jsonData length] && error == nil){
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }else{
        return nil;
    }
}

-(NSString *)convertToJsonData:(NSDictionary *)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}
-(void)buttonClick:(UIButton *)button{
    
    static BOOL buttoClik=YES;
    if (buttoClik) {
        FOURViewController *vc=[[FOURViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
      NSLog(@"%@",NSStringFromSelector(_cmd));
        buttoClik=!buttoClik;
    }
}

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
