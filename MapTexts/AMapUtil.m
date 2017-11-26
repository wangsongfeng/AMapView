//
//  AMapUtil.m
//  EmptyDemo
//
//  Created by apple on 2017/8/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "AMapUtil.h"
#define DefaultLocationTimeout 10
#define DefaultReGeocodeTimeout 5
@interface AMapUtil () <AMapLocationManagerDelegate>
@property (nonatomic, copy) AMapLocatingCompletionBlock completionBlock;
@end

@implementation AMapUtil

#pragma mark - Action Handle
-(void)configLocationManager
{
    self.locationManager = [[AMapLocationManager alloc] init];

    [self.locationManager setDelegate:self];
    //设置期望定位精度
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    //设置不允许系统暂停定位
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    //设置允许在后台定位
    [self.locationManager setAllowsBackgroundLocationUpdates:YES];
    //设置定位超时时间
    [self.locationManager setLocationTimeout:DefaultLocationTimeout];
    //设置逆地理超时时间
    [self.locationManager setReGeocodeTimeout:DefaultReGeocodeTimeout];
    
}
-(void)cleanUpAction
{
    //停止定位
    [self.locationManager stopUpdatingLocation];
    [self.locationManager setDelegate:nil];
}
-(void)reGeocodeAction
{
    [self configLocationManager];

    [self initCompleteBlock];
//    [self.locationManager startUpdatingLocation];

    
    __weak AMapUtil * weakSelf=self;
    
    //进行单次带逆地理定位请求
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        if (error)
        {
            
            if (weakSelf.returnAddriss!=nil) {
                weakSelf.returnAddriss(@"定位失败");
            }
            
            //如果为定位失败的error，则不进行后续操作
            if (error.code == AMapLocationErrorLocateFailed)
            {
                return;
            }
        }
        //得到定位信息
        if (location)
        {

            if (regeocode)
            {
                if (weakSelf.returnAddriss!=nil) {
                    weakSelf.returnAddriss([NSString stringWithFormat:@"%@%@%@",regeocode.province,regeocode.city,regeocode.district]);
                }
            }
            else
            {
                
                weakSelf.addriss=[NSString stringWithFormat:@"lat:%f;lon:%f \n accuracy:%.2fm", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy];
            }
        }

    }];
    
}
-(void)locAction
{
    //进行单次定位请求
    [self.locationManager requestLocationWithReGeocode:NO completionBlock:self.completionBlock];
}
#pragma mark - Initialization
-(void)initCompleteBlock
{
    self.completionBlock = ^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error)
    {
        
    };
}
#pragma mark - Life Cycle
-(void)dealloc
{
    [self cleanUpAction];
    NSLog(@"地图释放了");
    self.completionBlock = nil;
}

@end
