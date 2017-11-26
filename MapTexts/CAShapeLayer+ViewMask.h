//
//  CAShapeLayer+ViewMask.h
//  MapTexts
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface CAShapeLayer (ViewMask)
+ (instancetype)createMaskLayerWithView : (UIView *)view;
@end
