//
//  TextTableViewCell.h
//  MapTexts
//
//  Created by apple on 2017/8/16.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JPCollectionView.h"

@protocol JPCollectionViewDelegate <NSObject>

-(void)JpCollectionViewClick:(NSInteger)ClickCount with:(UICollectionView*)collectView;

@end

@interface TextTableViewCell : UITableViewCell

@property(nonatomic,assign)id<JPCollectionViewDelegate>Delegate;
@property(nonatomic,strong)JPCollectionView * jpCollectionView;


@end
