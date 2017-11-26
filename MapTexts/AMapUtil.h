//
//  AMapUtil.h
//  EmptyDemo
//
//  Created by apple on 2017/8/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AMapLocationKit/AMapLocationKit.h>

typedef void (^getAddrissBlock)(NSString*addriss);

@interface AMapUtil : NSObject

@property (nonatomic, strong) AMapLocationManager *locationManager;
@property(nonatomic,strong)NSString*addriss;


@property(nonatomic,copy)getAddrissBlock returnAddriss;
-(void)reGeocodeAction;

@end
