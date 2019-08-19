//
//  LeftAlignedFlowLayout.m
//  LeftAlignedCollectionView
//
//  Created by zhoufei on 16/5/12.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "LeftAlignedFlowLayout.h"
#import "Attribute.h"
#import "LayoutAttributeTools.h"


@interface LeftAlignedFlowLayout()
@property (assign,nonatomic)CGFloat leftMargin;//一行   距离左侧的距离
@property (assign,nonatomic)CGFloat itemMargin;//一行中 选项之间的距离
@end

@implementation LeftAlignedFlowLayout
- (void)configFlowLayoutWithFlowLayoutItemEdgeInsets:(FlowLayoutItemEdgeInsets)itemEdgeInsets sectionEdgeInsets:(FlowLayoutSectionEdgeInsets)sectionEdgeInsets {
    self.leftMargin = itemEdgeInsets.left;
    self.itemMargin = itemEdgeInsets.right;
    self.minimumInteritemSpacing=itemEdgeInsets.right;
    self.minimumLineSpacing = itemEdgeInsets.bottom;
    
    self.sectionInset = UIEdgeInsetsMake(sectionEdgeInsets.top, sectionEdgeInsets.left, sectionEdgeInsets.bottom, sectionEdgeInsets.right);
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray* attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    NSMutableArray * subArray = [LayoutAttributeTools groupTheSameLineItems:attributes];
    [self leftAlign_updateItemAttributeInSigleLine:subArray];
 
    return attributes;
}

- (void)leftAlign_updateItemAttributeInSigleLine:(NSMutableArray * )groupArray{
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
            NSPredicate *predice =[NSPredicate predicateWithFormat:@"index < %d",i];
            NSArray * resultArray = [modelArray filteredArrayUsingPredicate:predice];
            NSNumber * number = [resultArray valueForKeyPath:@"@sum.width"];
            
            leftWith = self.leftMargin+self.itemMargin*i+number.doubleValue;
            CGRect frame = attr.frame;
            frame.origin.x = leftWith;
            attr.frame = frame;
        }
        [modelArray removeAllObjects];
    }
}

@end
