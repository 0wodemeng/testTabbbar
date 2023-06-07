//
//  ONEViewController.m
//  testTabbbar
//
//  Created by 陈列 on 2018/7/30.
//  Copyright © 2018年 陈列. All rights reserved.
//

#import "ONEViewController.h"
#import "THIRDViewController.h"
#import <iAd/iAd.h>

#import "testListTableViewCell.h"
#import "informationModel.h"
#import "LVRecordTool.h"

#import <AVFoundation/AVFoundation.h> // 基于AVFoundation,通过实例化的控制器来设置player属性

#import <AVKit/AVKit.h>  // 1. 导入头文件  iOS 9 新增



@interface ONEViewController ()<UIPrintInteractionControllerDelegate>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,strong) NSDictionary *titleDict;
@property(nonatomic,strong) informationModel *model;

//@property(nonatomic,strong) NSMutableArray *cardArray;
//@property(nonatomic,strong) UIButton *button;
//
//@property(nonatomic,strong) ADBannerView *bannerView;
//@property(nonatomic,strong) ADClient *adClient;

@property(nonatomic,assign) BOOL isClick;
@property(nonatomic, strong) NSTimer *voiceTimer;
@property (nonatomic, strong) LVRecordTool *recordTool;

@property (nonatomic, strong) UISlider *sliderProgress;

@property(nonatomic,strong) NSIndexPath *indexPath;

@end

@implementation ONEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor orangeColor]];
    _isClick=NO;
    _recordTool = [LVRecordTool sharedRecordTool];
    _dataArray=[NSMutableArray new];
    
    
    _model=[[informationModel alloc] init];
    _model.name=@"张丽";
    _model.education=@"大学";
    _model.mobile=@"1793792434";
    _model.address=@"17楼3排417楼3排417楼3排417楼3排417楼3排417楼3排417楼3排417楼3排417楼3排417楼3排417楼3排4";
    [_dataArray addObjectsFromArray:[CLTooll  getClassAttribute:_model]];
//
//    NSString *plistPath=[[NSBundle mainBundle] pathForResource:@"applyInformation" ofType:@"plist"];
//    _titleDict=[NSDictionary dictionaryWithContentsOfFile:plistPath];
//
    _tableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
        [self.view addSubview:_tableView];
    _tableView.tableFooterView=[UIView new];
    

    
    UIButton *record1=[[UIButton alloc] initWithFrame:CGRectMake(0,100 , 50, 50)];
    [record1 addTarget:self action:@selector(cordButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [record1 setBackgroundColor:[UIColor redColor]];
    [record1 setTitle:@"前" forState:UIControlStateNormal];
    [record1 setTag:1];
//    [self.view addSubview:record1];
    
    UIButton *record=[[UIButton alloc] initWithFrame:CGRectMake(100,100 , 50, 50)];
    [record addTarget:self action:@selector(cordButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [record setBackgroundColor:[UIColor redColor]];
    [record setTag:2];
//    [self.view addSubview:record];
    
    UIButton *record2=[[UIButton alloc] initWithFrame:CGRectMake(200,100 , 50, 50)];
    [record2 addTarget:self action:@selector(cordButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [record2 setBackgroundColor:[UIColor redColor]];
    [record2 setTitle:@"后" forState:UIControlStateNormal];
    [record2 setTag:3];
//    [self.view addSubview:record2];
    
//    _sliderProgress = [[UISlider alloc] init];
//    _sliderProgress.value = 0.f;
//    _sliderProgress.continuous = YES;
//    _sliderProgress.tintColor = [UIColor orangeColor];
//    _sliderProgress.maximumTrackTintColor = [UIColor clearColor];
    //         _sliderProgress.minimumTrackTintColor = [UIColor clearColor];
//    [self.view addSubview:_sliderProgress];
//    [_sliderProgress setThumbImage:[UIImage imageNamed:@"sliderBall"] forState:UIControlStateNormal];
//    [_sliderProgress addTarget:self action:@selector(durationSliderTouch:) forControlEvents:UIControlEventValueChanged];
//    [_sliderProgress addTarget:self action:@selector(durationSliderTouchEnded:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
    
    CGPoint point=CGPointMake(10, 10);
    NSIndexPath *indexPath=[self.tableView indexPathForRowAtPoint:point];
    UITableViewCell *cell=[self.tableView  cellForRowAtIndexPath:indexPath];
    NSIndexPath *cellPath=[self.tableView indexPathForCell:cell];
}

- (void)printInteractionControllerWillStartJob:(UIPrintInteractionController *)printInteractionController{
    
}
- (void)printInteractionControllerDidFinishJob:(UIPrintInteractionController *)printInteractionController{
    
}

-(void)cordButtonClicked:(UIButton *)button{
    
    UIImage *image=[UIImage imageNamed:@"print"];
    NSData *myPDFData=UIImageJPEGRepresentation(image,1.0f);
    
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    if  (pic && [UIPrintInteractionController canPrintData: myPDFData] ) {
        pic.delegate = self;
        
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.outputType = UIPrintInfoOutputGeneral;
        printInfo.jobName = @"printImage";
        printInfo.duplex = UIPrintInfoDuplexLongEdge;
        pic.printInfo = printInfo;
        pic.showsPageRange = YES;
        pic.printingItem = myPDFData;
        
        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
        ^(UIPrintInteractionController *pic, BOOL completed, NSError *error) {
//            self.content = nil;
            if (!completed && error)
                NSLog(@"FAILED! due to error in domain %@ with error code %u",
                      error.domain, error.code);
        };
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
//            [pic presentFromBarButtonItem:self.printButton animated:YES completionHandler:completionHandler];
        } else {
            [pic presentAnimated:YES completionHandler:completionHandler];
        }
    }
    
//    [_tableView setEditing:YES];
//    NSLog(@"selec %d",button.selected);
////    button.selected=!button.selected;
//    switch (button.tag) {
//        case 1:{
//
//        }
//            break;
//        case 2:{
//            [_recordTool playRecordingFile];
//        }
//            break;
//        case 3:{
//
//        }
//            break;
//
//        default:
//            break;
//    }
    
    
    //    if (!_isClick) {
    //        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    //        if(authStatus==AVAuthorizationStatusAuthorized) {
    //            [self.recordTool startRecording];
    //            [self intiTime];
    //        }
    //        else {
    //            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
    //                if(!granted) {
    //                    return ;
    //                }
    //            }];
    //        }
    //    }
    //    else{
    //
    //        [self stopPowerTimer];
    //    }
    //
    //    _isClick=!_isClick;
}
//- (void)intiTime{
//    //定时获取音量
//    self.voiceTimer = [NSTimer scheduledTimerWithTimeInterval: 0.025 target:self selector:@selector(powerTimerUpdate) userInfo:nil repeats:true];
//    [self.voiceTimer fire];
//
//
//}
//
//- (void)powerTimerUpdate
//{
//    if (self.recordTool.recorder.isRecording) {
//
//        float time = self.recordTool.recorder.currentTime;
//        NSInteger time2 = time * 100;
//        NSInteger timeMin = (time2 / 6000)%6000;
//        NSInteger timeSe = time2 % 6000;
//
//
//
//
//        NSString *timeString;
//
//        timeString = [NSString stringWithFormat:@"00:0%ld:0%0.2f",timeMin,(timeSe / 100.00)];
//
//        NSLog(@"timeString %@",timeString);
//    }
//}
//
//- (void)stopPowerTimer {
//    if (self.voiceTimer) {
//        [self.voiceTimer invalidate];
//        self.voiceTimer = nil;
//    }
//}
//
////-(UIButton *)button{
////    if (!_button) {
////        _button=[UIButton buttonWithType:UIButtonTypeCustom];
////        [_button setBackgroundColor:[UIColor redColor]];
////        [_button setFrame:CGRectMake(100, 100, 100, 100)];
////        [_button addTarget:self action:@selector(buttonClick:) /Users/chenlie/Desktop/testTabbbar/testTabbbar/TWOViewController.hforControlEvents:UIControlEventTouchUpInside];
////    }
////    return _button;
////}
//
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIn=@"cellddd";
    testListTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIn];
    if (cell==nil) {
        cell=[[testListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIn];
    }
    NSString *property=[_dataArray objectAtIndex:indexPath.row];
    [cell.titleLabel setText:[_titleDict objectForKey:property]];
    [cell.contentLabel setText:[_model valueForKey:property]];
    
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
//    cell.accessoryView=[UISwitch new];
//    if (_indexPath) {
//        if (indexPath==_indexPath) {
//           [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
//        }
//        else
//            [cell setAccessoryType:UITableViewCellAccessoryNone];
//    }
    
    return cell;
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *property=[_dataArray objectAtIndex:indexPath.row];
    CGSize size = [[_model valueForKey:property] sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(CGRectGetWidth(self.view.frame)-120, 1000) lineBreakMode:UILineBreakModeCharacterWrap];
    
    return size.height+28;
}

//-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [_dataArray removeObjectAtIndex:indexPath.row];
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.isEditing) {
        // 多选
        return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
    }else{
//         删除
        return UITableViewCellEditingStyleDelete;
    }
}


#pragma mark 点击tableviewcell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击第几行 row == %ld",(long)indexPath.row);
    
//    if (_indexPath) {
//
//
//        NSIndexPath *tempIndex=_indexPath;
//        _indexPath=indexPath;
//
//        [tableView reloadRowsAtIndexPaths:@[tempIndex] withRowAnimation:UITableViewRowAnimationFade];
//    }
//    _indexPath=indexPath;
//    [tableView reloadRowsAtIndexPaths:@[_indexPath] withRowAnimation:UITableViewRowAnimationFade];
}
//
//
//
//
//
//
//
//
////
////-(void)buttonClick:(UIButton *)button{
//////    THIRDViewController *vc=[[THIRDViewController alloc] init];
//////    vc.title=@"third";
//////    [self.navigationController pushViewController:vc animated:YES];
////
////    [_cardArray removeAllObjects];
////    for (int i=0; i<6; i++) {
////        [_cardArray addObject:[NSNumber numberWithInt:[self getrandom]]];
////    }
////
////    for (NSNumber *num in _cardArray) {
////        int cardcolor=[num intValue]/13;//0 红 1 方 2 黑 3 梅
////        int cardNum=[num intValue]%13;
////        NSLog(@" cardColr --> %d  cardNum--->%d",cardcolor,cardNum);
////    }
////
////    NSLog(@"cardArray %@",_cardArray);
////
////}
////
////-(int )getrandom{
////    int result=-1;
////    int card= arc4random() % 52+1;
////    for (int i=0; i<_cardArray.count; i++) {
////        if (card==[[_cardArray objectAtIndex:i] intValue]) {
////            result=1;
////            break;
////        }
////    }
////    if (result==1) {
////        [self getrandom];
////    }
////    return  card;
////}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
