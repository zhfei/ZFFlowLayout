//
//  RightAlignedFlowLayout.m
//  LeftAlignedCollectionView
//
//  Created by zhoufei on 2017/5/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "RightAlignedFlowLayout.h"
#import "Attribute.h"

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
    
    NSMutableArray * subArray = [NSMutableArray arrayWithCapacity:attributes.count];
    NSMutableArray * currenArray = [NSMutableArray arrayWithCapacity:attributes.count];
    
    for (int i=0; i<[attributes count]; i++) {
        UICollectionViewLayoutAttributes *attr = [attributes objectAtIndex:i];
        //当类型为UICollectionElementKindCell时，修改布局
        if (attr.representedElementKind==nil) {
            
            UICollectionViewLayoutAttributes *lastAttr = [currenArray firstObject];
            if (!lastAttr || lastAttr.frame.origin.y == attr.frame.origin.y) {
                
                [currenArray addObject:attr];
            } else {
                [subArray addObject:[NSArray arrayWithArray:currenArray]];
                [currenArray removeAllObjects];
                [currenArray addObject:attr];
            }
            
        }
        
    }
    if (currenArray.count) {
        [subArray addObject:[NSArray arrayWithArray:currenArray]];
        [currenArray removeAllObjects];
    }
    
    NSMutableArray * modelArray = [NSMutableArray array];
    
    for (NSArray * array  in subArray) {
        
        NSInteger count = array.count;
        
        for (int i = 0; i<count; i++) {
            UICollectionViewLayoutAttributes *attrOne = array[i];
            [modelArray addObject:[Attribute AttributeWithIndex:i width:attrOne.size.width]];
            
        }
        
        CGFloat leftWith = rect.size.width -self.rightMargin-self.itemMargin*(count-1);

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
    
    
    
    return attributes;
}


@end
