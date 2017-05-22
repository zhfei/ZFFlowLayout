//
//  RightAlignedFlowLayout.m
//  LeftAlignedCollectionView
//
//  Created by zhoufei on 2017/5/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "RightAlignedFlowLayout.h"
#import "Attribute.h"
#import "LayoutAttributeTools.h"

@interface RightAlignedFlowLayout ()
@property (assign,nonatomic)CGFloat rightMargin;//一行   距离右侧的距离
@property (assign,nonatomic)CGFloat itemMargin;//一行中 选项之间的距离
@end

@implementation RightAlignedFlowLayout


- (void)configFlowLayoutWithFlowLayoutItemEdgeInsets:(FlowLayoutItemEdgeInsets)itemEdgeInsets sectionEdgeInsets:(FlowLayoutSectionEdgeInsets)sectionEdgeInsets {
    
    self.rightMargin = itemEdgeInsets.right;
    self.itemMargin  = itemEdgeInsets.left;
    
    self.minimumInteritemSpacing = itemEdgeInsets.left;
    self.minimumLineSpacing = itemEdgeInsets.bottom;
    
    self.sectionInset = UIEdgeInsetsMake(sectionEdgeInsets.top, sectionEdgeInsets.left, sectionEdgeInsets.bottom, sectionEdgeInsets.right);
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    NSMutableArray * subArray = [LayoutAttributeTools groupTheSameLineItems:attributes];
    
    [self rightAlign_updateItemAttributeInSigleLine:subArray rect:rect];
    
    return attributes;
}

/*!
 *  @author zhoufei
 *
 *  @brief 更新每个元素的位置
 *  @param groupArray 归并后的结果数组
 *  @param rect       原始布局的rect
 */
- (void)rightAlign_updateItemAttributeInSigleLine:(NSMutableArray * )groupArray rect:(CGRect)rect{
    
    NSMutableArray * modelArray = [NSMutableArray array];
    
    for (NSArray * array  in groupArray) {
        
        NSInteger count = array.count;
        
        if (!count) {
            continue;
        }
        
        for (int i = 0; i<count; i++) {
            UICollectionViewLayoutAttributes *attrOne = array[i];
            [modelArray addObject:[Attribute AttributeWithIndex:i width:attrOne.size.width]];
            
        }
        
        CGFloat leftWith = 0;
        
        for (int i=0; i<count; i++) {
            
            UICollectionViewLayoutAttributes *attr = [array objectAtIndex:i];
            
            NSPredicate *predice =[NSPredicate predicateWithFormat:@"index >= %d",i];
            NSArray * resultArray = [modelArray filteredArrayUsingPredicate:predice];
            NSNumber * number = [resultArray valueForKeyPath:@"@sum.width"];
            
            leftWith = rect.size.width -self.rightMargin-self.itemMargin*(count-1-i)-number.doubleValue;
            CGRect frame = attr.frame;
            frame.origin.x = leftWith;
            attr.frame = frame;
            
        }
        [modelArray removeAllObjects];
    }

}



@end
