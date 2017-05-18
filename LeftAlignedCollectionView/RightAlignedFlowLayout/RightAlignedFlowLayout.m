//
//  RightAlignedFlowLayout.m
//  LeftAlignedCollectionView
//
//  Created by zhoufei on 2017/5/18.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "RightAlignedFlowLayout.h"

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
    
    
//    for (NSArray * array  in subArray) {
//        
//        CGFloat totalWidth = 0;
//        for (UICollectionViewLayoutAttributes *attr1 in array) {
//            totalWidth += attr1.size.width;
//        }
//        CGFloat leftWith = rect.size.width - self.rightMargin-self.rightMargin-self.itemMargin*(array.count-1)-totalWidth;
//
//        for (int i=0; i<[array count]; i++) {
//            if (i>0) {
//                UICollectionViewLayoutAttributes *attr = [attributes objectAtIndex:i-1];
//            }
//            
//        }
//    }
    
    
    
    return attributes;
}


@end
