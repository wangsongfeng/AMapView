//
//  JPCollectionView.m
//  xxx
//
//  Created by xxx on 2017/5/4.
//  Copyright © 2017年 xxx. All rights reserved.
//

#import "JPCollectionView.h"
#import "JPFlowLayout.h"
#import "JPCell.h"
@interface JPCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray * nameArray;
    NSMutableArray * zhutiArray;
    NSInteger ShareCount;

    NSIndexPath *currentIndexPath;

}
@property (nonatomic, weak) UIScrollView *placeholderSV;

@end

@implementation JPCollectionView

static NSString *const JPCellID = @"JPCell";
//王松锋这里要改的

static NSInteger const MaxItemCount = 20;

+ (JPCollectionView *)collectionViewWithFrame:(CGRect)frame {
    JPFlowLayout *flowLayout = [[JPFlowLayout alloc] init];
    
    
    
    flowLayout.itemSize =CGSizeMake(80, 80*(122/80.0));

    JPCollectionView *collectionView = [[self alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    return collectionView;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
          //王松锋这里要改的
//        nameArray=[NSMutableArray arrayWithObjects:@"三生三世",@"三生三世1",@"丹凤凝",@"春欲晚",@"蓝绣",@"琉璃翠",@"女儿情",@"静籁听香",@"金兰",@"燕歌行",@"鬓间花",@"挽青袖",@"临清竹",@"玉簟秋",@"永安春深",@"笛声远",@"扎西阿姆",@"梦未央",@"故梦", nil];
//        zhutiArray=[NSMutableArray arrayWithObjects:@"theme1",@"theme2",@"theme3",@"theme4",@"theme5",@"theme6",@"theme7",@"theme8",@"theme9",@"theme10",@"theme11",@"theme12",@"theme13",@"theme14",@"theme15",@"theme16",@"theme17",@"theme18",@"theme19",  nil];
//        nameArray=[NSMutableArray arrayWithObjects:@"三生三世",@"三生三世1",@"丹凤凝",@"春欲晚",@"蓝绣",@"琉璃翠",@"女儿情",@"静籁听香",@"金兰",@"燕歌行",@"鬓间花",@"挽青袖",@"临清竹",@"玉簟秋",@"永安春深",@"笛声远",@"扎西阿姆",@"梦未央",@"故梦", nil];
        zhutiArray=[NSMutableArray arrayWithObjects:@"theme13",@"theme14",@"theme15",@"theme16",@"theme17",  nil];
        self.backgroundColor=[UIColor clearColor];
        self.showsHorizontalScrollIndicator=YES;

        [self registerClass:[JPCell class] forCellWithReuseIdentifier:JPCellID];
        self.delegate = self;
        self.dataSource = self;
        self.scrollEnabled = NO;
        
        CGFloat width = 90*4;
        UIScrollView *placeholderSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
        placeholderSV.pagingEnabled = YES;
        placeholderSV.delegate = self;
        placeholderSV.showsHorizontalScrollIndicator = YES;
        [placeholderSV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
        [self addSubview:placeholderSV];
        self.placeholderSV = placeholderSV;
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.placeholderSV) {
        self.contentOffset = scrollView.contentOffset;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return self.placeholderSV;
}
- (void)tap:(UITapGestureRecognizer *)tapGR {
    CGPoint point = [tapGR locationInView:self];
    NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];
    if (indexPath) {
        [self collectionView:self didSelectItemAtIndexPath:[self indexPathForItemAtPoint:point]];
    }
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.placeholderSV.contentSize = CGSizeMake(90*MaxItemCount, 0);
    return MaxItemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JPCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:JPCellID forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%zd", indexPath.item];    
    return cell;

}

#pragma mark - UICollectionViewDataSource

#pragma mark cell点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//    [MobClick event:@"fengfeng"];
    
    currentIndexPath=indexPath;
    
    if (currentIndexPath==indexPath) {
        
        collectionView.allowsSelection=NO;
        
    }
    if ([self.DelegateClick respondsToSelector:@selector(collectionViewClick:with:)]) {
        [self.DelegateClick collectionViewClick:indexPath.row with:self];
    }
    [collectionView reloadData];
    
}



@end
