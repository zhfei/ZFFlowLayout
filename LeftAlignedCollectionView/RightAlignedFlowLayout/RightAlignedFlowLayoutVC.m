//
//  RightAlignedFlowLayoutVC.m
//  LeftAlignedCollectionView
//
//  Created by xuyefeng on 17/5/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "RightAlignedFlowLayoutVC.h"
#import "RightAlignedFlowLayout.h"
#import "Masonry.h"
#import "NSString+YYAdditions.h"

static CGFloat  ItemMarginWithLeftEdge=10; //cell距离左边界距离
static CGFloat  ItemMarginWithRightEdge=10;//cell距离右边界距离
static CGFloat  itemMarginWithitem=20;     //cell距离相邻cell距离

static NSString * const reuseIdentifier = @"Cell";

@interface RightAlignedFlowLayoutVC ()
@property (nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation RightAlignedFlowLayoutVC


- (instancetype)initWithRightAlignedFlowLayout
{
    //左对齐流水布局设置
    RightAlignedFlowLayout * flow =[RightAlignedFlowLayout new];
    [flow configFlowLayoutWithFlowLayoutItemEdgeInsets:(FlowLayoutItemEdgeInsets){20,ItemMarginWithLeftEdge,20,itemMarginWithitem}
                                     sectionEdgeInsets:(FlowLayoutSectionEdgeInsets){20,ItemMarginWithLeftEdge,20,ItemMarginWithRightEdge}];
    
    
    self = [[[self class]alloc]initWithCollectionViewLayout:flow];
    if (self) {
        self.collectionView.backgroundColor=[UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Register cell classes
    self.collectionView.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"timg3.jpeg"].CGImage);
    self.title = @"左对齐流水布局";
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    NSString *string =@"西湖，";
    
    self.dataSource=[NSMutableArray array];
    for (int i=0; i<60; i++) {
        int count =arc4random_uniform(5);
        NSMutableString *stringM =[NSMutableString string];
        for (int j=0; j<count; j++) {
            [stringM appendString:string];
        }
        [stringM appendString:[NSString stringWithFormat:@"%d",i]];
        
        [self.dataSource addObject:stringM];
    }
    
}
/*!
 *  @author zhoufei
 *
 *  @brief 将view四个直角剪切成圆角
 *
 *  @param view 要剪切的view
 */
- (void)clipRoundCorners:(UIView *)view
{
    view.layer.cornerRadius=22;
    view.layer.masksToBounds=YES;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if ([cell.contentView.subviews count]) {
        
        UILabel *label =cell.contentView.subviews.lastObject;
        label.text=self.dataSource[indexPath.row];
        
    }else{
        
        [cell.contentView setBackgroundColor:[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]];
        UILabel *label =[[UILabel alloc]init];
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        label.textAlignment=NSTextAlignmentCenter;
        label.font=[UIFont systemFontOfSize:16];
        label.text=self.dataSource[indexPath.row];
        
        [self clipRoundCorners:cell.contentView];
    }
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat width= [self.dataSource[indexPath.row] calculateWidthWithHeihgt:44 Font:16];
    
    return CGSizeMake(width+40, 44);
}


@end
