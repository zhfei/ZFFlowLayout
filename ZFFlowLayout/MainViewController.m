//
//  MainViewController.m
//  LeftAlignedCollectionView
//
//  Created by xuyefeng on 17/5/17.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "MainViewController.h"
#import "ZFFlowLayoutVC.h"
#import "ZFFlowLayout.h"
#import "ZFFlowLayout-Swift.h"

@interface MainViewController ()
- (IBAction)leftAlignBtnAction:(id)sender;
- (IBAction)RightAlignBtnAction:(id)sender;
- (IBAction)AxisBtnAction:(UIButton *)sender;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"流水布局";
    
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"timg3.jpeg"].CGImage);
}

- (IBAction)leftAlignBtnAction:(id)sender {
    UICollectionViewFlowLayout * flowLayout = [ZFFlowLayout flowLayoutWithFlowLayoutType:FlowLayoutType_leftAlign];
    
    ZFFlowLayoutVC * vc = [[ZFFlowLayoutVC alloc] initWithFlowLayout:flowLayout];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)RightAlignBtnAction:(id)sender {
    UICollectionViewFlowLayout * flowLayout = [ZFFlowLayout flowLayoutWithFlowLayoutType:FlowLayoutType_rightAlign];
    
    ZFFlowLayoutVC * vc = [[ZFFlowLayoutVC alloc] initWithFlowLayout:flowLayout];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)AxisBtnAction:(UIButton *)sender {
    UICollectionViewFlowLayout * flowLayout = [ZFFlowLayout flowLayoutWithFlowLayoutType:FlowLayoutType_axis];
    ZFFlowLayoutVC * vc = [[ZFFlowLayoutVC alloc] initWithFlowLayout:flowLayout];
    vc.collectionView.showsHorizontalScrollIndicator = NO;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)WaterFallBtnAction:(UIButton *)sender {
    ZFWaterFallLayout * waterFallLayout = [[ZFWaterFallLayout alloc] init];

    waterFallLayout.rowSpacing = 10;
    waterFallLayout.columnCount = 3;
    waterFallLayout.colunmSpacing = 20;
    waterFallLayout.sectionInset = UIEdgeInsetsMake(10, 10, 200, 10);
    
    ZFWaterFallCollectionViewController * vc = [[ZFWaterFallCollectionViewController alloc] initWithCollectionViewLayout:waterFallLayout];
    vc.collectionView.showsHorizontalScrollIndicator = NO;
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}

@end
