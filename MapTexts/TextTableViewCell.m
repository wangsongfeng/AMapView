//
//  TextTableViewCell.m
//  MapTexts
//
//  Created by apple on 2017/8/16.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import "TextTableViewCell.h"

@implementation TextTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

-(JPCollectionView*)jpCollectionView{
    if (_jpCollectionView==nil) {
        _jpCollectionView=[JPCollectionView collectionViewWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, (80)*(122/80.0)+30+14)];
        _jpCollectionView.backgroundColor=[UIColor blueColor];
        [self addSubview:_jpCollectionView];
    }
    return _jpCollectionView;
}
@end
