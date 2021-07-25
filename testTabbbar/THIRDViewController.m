//
//  THIRDViewController.m
//  testTabbbar
//
//  Created by 陈列 on 2018/7/30.
//  Copyright © 2018年 陈列. All rights reserved.
//

#import "THIRDViewController.h"
#import "GTools.h"
#import "SDAutoLayout.h"
#import "FOURViewController.h"

#define AppScreenW [UIScreen mainScreen].bounds.size.width
#define AppScreenH [UIScreen mainScreen].bounds.size.height

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)

#define SIZE [[UIScreen mainScreen] bounds].size.width / 375

#define AppRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define APPTHEMECOLOR AppRGBA(0,145,249,1)

@interface THIRDViewController ()

@end

@implementation THIRDViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    CGFloat navH = NAVIGATION_BAR_HEIGHT;
    CGFloat tableViewH = AppScreenH-navH-40*SIZE;
    
  
    
    
    UIButton *Button=[UIButton buttonWithType:UIButtonTypeCustom];
    [Button setBackgroundColor:[UIColor redColor]];
    [Button setFrame:CGRectMake(100, 100, 100, 100)];
    [Button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside]; 
    [self.view addSubview:Button];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0,CGRectGetHeight(self.view.frame)-NAVIGATION_BAR_HEIGHT-40*SIZE, AppScreenW, 40*SIZE)];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [GTools configureButton:nextBtn addTarget:self WithAction:@selector(nextAction) withFont:17 withTextColor:[UIColor whiteColor] withTitle:@"提交" withBackColor:APPTHEMECOLOR];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [GTools configureButton:backBtn addTarget:self WithAction:@selector(backAction) withFont:17 withTextColor:APPTHEMECOLOR withTitle:@"放弃贷款" withBackColor:[UIColor whiteColor]];
    backBtn.layer.borderColor = APPTHEMECOLOR.CGColor;
    backBtn.layer.borderWidth = 1;
    
    [bottomView addSubview:nextBtn];
    [bottomView addSubview:backBtn];
    
    backBtn.sd_layout
    .leftSpaceToView(bottomView, 0)
    .widthIs(AppScreenW/2)
    .bottomSpaceToView(bottomView, 0)
    .heightIs(40*SIZE);
    
    nextBtn.sd_layout
    .rightSpaceToView(bottomView, 0)
    .widthIs(AppScreenW/2)
    .bottomSpaceToView(bottomView, 0)
    .heightIs(40*SIZE);
    //    __weak typeof(self) weakSelf = self;
    
    
    [self.view addSubview:bottomView];
    // Do any additional setup after loading the view.
}

-(void)nextAction{
    
}

-(void)backAction{
    
}

-(void)buttonClick:(UIButton *)button{
    FOURViewController *vc=[[FOURViewController alloc] init];
    vc.title=@"FOUR";
    [self.navigationController pushViewController:vc animated:YES];
    
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
