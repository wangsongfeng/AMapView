//
//  ViewController.m
//  MapTexts
//
//  Created by apple on 2017/8/2.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import "ViewController.h"
#import "TextViewController.h"
#import "NSString+JudgeExtension.h"
#import "CAShapeLayer+ViewMask.h"
#import "TextTableViewCell.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,cellClickDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property(nonatomic,strong)UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

-(UITableView*)tableView{
    if (_tableView==nil) {
        _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[TextTableViewCell class] forCellReuseIdentifier:@"Text"];
        UIImageView*imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        imageView.backgroundColor=[UIColor yellowColor];
        _tableView.tableHeaderView=imageView;
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else
    {
        return 30;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        TextTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"Text"];
        cell.jpCollectionView.DelegateClick=self;
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        return cell;

    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return (80)*(122/80.0)+30+14;
    }else{
        return 100;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view=[[UIView alloc]init];
    view.backgroundColor=[UIColor redColor];
    if (section==1) {
        view.backgroundColor=[UIColor grayColor];
    }
    return view;
}

-(void)collectionViewClick:(NSInteger)ClickCount with:(UICollectionView *)collectView{
    NSLog(@"%ld",(long)ClickCount);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.navigationController pushViewController:[[TextViewController alloc]init] animated:YES];
}

@end
