//
//  ZFFlowLayoutVC.m
//  LeftAlignedCollectionView
//
//  Created by zhoufei on 16/5/12.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "ZFFlowLayoutVC.h"
#import "LeftAlignedFlowLayout.h"
#import "Masonry.h"

static NSString * const reuseIdentifier = @"Cell";

@interface ZFFlowLayoutVC ()
@property (nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation ZFFlowLayoutVC
- (instancetype)initWithFlowLayout:(UICollectionViewFlowLayout*)flowLayout {
    self = [[[self class]alloc]initWithCollectionViewLayout:flowLayout];
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
 *  @brief 将view四个直角剪切成圆角
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
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width= [self calculateSizeWithHeight:44 Font:16 string:self.dataSource[indexPath.row]].width;
    
    return CGSizeMake(width+40, 44);
}

- (CGSize)calculateSizeWithHeight:(CGFloat)height Font:(CGFloat)font string:(NSString *)string {
    CGSize size = CGSizeMake(0, height);
    CGSize tempSize;
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:font]};
    tempSize = [string boundingRectWithSize:size options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return tempSize;
}

@end
