//
//  CAShapeLayer+ViewMask.m
//  MapTexts
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import "CAShapeLayer+ViewMask.h"

@implementation CAShapeLayer (ViewMask)

//怎样使用
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(40, 50, 80, 100)];
//    view.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:view];
//
//    CAShapeLayer *layer = [CAShapeLayer createMaskLayerWithView:view];
//    view.layer.mask = layer;



+ (instancetype)createMaskLayerWithView : (UIView *)view{
    
    CGFloat viewWidth = CGRectGetWidth(view.frame);
    CGFloat viewHeight = CGRectGetHeight(view.frame);
    
    CGFloat rightSpace = 10.;
    CGFloat topSpace = 15.;
    
    CGPoint point1 = CGPointMake(0, 0);
    CGPoint point2 = CGPointMake(viewWidth-rightSpace, 0);
    CGPoint point3 = CGPointMake(viewWidth-rightSpace, topSpace);
    CGPoint point4 = CGPointMake(viewWidth, topSpace);
    CGPoint point5 = CGPointMake(viewWidth-rightSpace, topSpace+10.);
    CGPoint point6 = CGPointMake(viewWidth-rightSpace, viewHeight);
    CGPoint point7 = CGPointMake(0, viewHeight);
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    [path addLineToPoint:point6];
    [path addLineToPoint:point7];
    [path closePath];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    
    return layer;
}
@end
