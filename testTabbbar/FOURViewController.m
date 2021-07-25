//
//  FOURViewController.m
//  testTabbbar
//
//  Created by 陈列 on 2019/5/29.
//  Copyright © 2019年 陈列. All rights reserved.
//

#import "FOURViewController.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FOURViewController ()<MKMapViewDelegate>
{
    MKMapView *_mapview;
    CLLocationManager *_manager;
}
@end

@implementation FOURViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [[CLLocationManager alloc]init];
    [_manager requestAlwaysAuthorization];
    [_manager requestWhenInUseAuthorization];
    [_manager startUpdatingLocation];
    
    _mapview = [[MKMapView alloc]initWithFrame:self.view.bounds];
    _mapview.mapType = MKMapTypeStandard;
    /*
     MKMapTypeStandard 街景
     MKMapTypeSatellite 卫星
     MKMapTypeHybrid 混合
     */
    _mapview.zoomEnabled = YES;//允许被缩放
    _mapview.scrollEnabled = YES; //允许被拖动
    _mapview.showsUserLocation = YES; //展示用户位置
    _mapview.delegate = self; //打开代理
    [self.view addSubview:_mapview];
    
    
}
//协议方法,用户位置加载完毕
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    //获取用户当前的位置
    CLLocation *location = userLocation.location;
    
    CLLocationCoordinate2D coordinate = location.coordinate; //用户的经纬度
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);//指定地图缩放比率 0~1.0
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    //让地图移到指定的位置并以对应的缩放比率显示地图
    [_mapview setRegion:region animated:YES];
    //大概意思就是region表示地图中的一块区域，它有两个字段一个是center，就是这块区域中心点的经纬度；另一个是span，大概意思就是span表示的是regoin的范围。它有两个字段一个是latitudeDelta，表示纬度范围，南纬和北纬加一起应该有180度，所以它的范围应该是大于0度，小于等于180度；另一个是longitudeDelta，表示经度范围，东经和西经加一起应该有360度，所以它的范围应该是大于0度，小于360度
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
