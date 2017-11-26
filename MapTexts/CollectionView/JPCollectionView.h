//
//  JPCollectionView.h
//  xxx
//
//  Created by xxx on 2017/5/4.
//  Copyright © 2017年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol cellClickDelegate <NSObject>

-(void)collectionViewClick:(NSInteger)ClickCount with:(UICollectionView*)collectView;
@end
@interface JPCollectionView : UICollectionView
@property(nonatomic,assign)id<cellClickDelegate>DelegateClick;
@property(nonatomic,copy)void(^cellClickBlock)(NSInteger ClickCount, UICollectionView * collectView);
+ (JPCollectionView *)collectionViewWithFrame:(CGRect)frame;
@end
