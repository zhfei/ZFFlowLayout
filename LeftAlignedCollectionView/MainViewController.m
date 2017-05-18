//
//  MainViewController.m
//  LeftAlignedCollectionView
//
//  Created by xuyefeng on 17/5/17.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "MainViewController.h"
#import "LeftAlignedFlowLayoutVC.h"
#import "RightAlignedFlowLayoutVC.h"

@interface MainViewController ()
- (IBAction)leftAlignBtnAction:(id)sender;
- (IBAction)RightAlignBtnAction:(id)sender;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"流水布局";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)leftAlignBtnAction:(id)sender {
    
    LeftAlignedFlowLayoutVC * vc = [[LeftAlignedFlowLayoutVC alloc] initWithLeftAlignedFlowLayout];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)RightAlignBtnAction:(id)sender {
    RightAlignedFlowLayoutVC * rightVC = [[RightAlignedFlowLayoutVC alloc] initWithRightAlignedFlowLayout];
    [self.navigationController pushViewController:rightVC animated:YES];
}
@end
