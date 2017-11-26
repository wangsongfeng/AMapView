//
//  TextViewController.m
//  MapTexts
//
//  Created by apple on 2017/8/11.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import "TextViewController.h"
#import "AMapUtil.h"
#import <MAMapKit/MAMapKit.h>
@interface TextViewController ()<MAMapViewDelegate>
@property(nonatomic,strong)AMapUtil*map;

@property(nonatomic,strong)MAMapView * mapView;
@end

@implementation TextViewController
-(void)dealloc{
    NSLog(@"释放了");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.map=[[AMapUtil alloc]init];

    [self.map reGeocodeAction];
    self.map.returnAddriss = ^(NSString *addriss) {

        NSLog(@"王松锋%@",addriss);
    };
    
    self.mapView = [[MAMapView alloc]initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.mapView];
    self.mapView.zoomLevel = 17;
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
}
-(void)mapInitComplete:(MAMapView *)mapView{
    
}

@end
