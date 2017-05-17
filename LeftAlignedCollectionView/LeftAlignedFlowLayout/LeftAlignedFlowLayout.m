//
//  LeftAlignedFlowLayout.m
//  LeftAlignedCollectionView
//
//  Created by zhoufei on 16/5/12.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "LeftAlignedFlowLayout.h"

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


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    for (int i=0; i<[attributes count]; i++) {
        UICollectionViewLayoutAttributes *attr = [attributes objectAtIndex:i];
        //当类型为UICollectionElementKindCell时，修改布局
        if (attr.representedElementKind==nil) {
            
            //分组展示时，每组的开始row都等于0
            if (attr.indexPath.row==0) {
                attr.frame=CGRectMake(self.leftMargin, attr.frame.origin.y, attr.frame.size.width, attr.frame.size.height);
            }else{
                if (i>0) {
                    
                    UICollectionViewLayoutAttributes *subAttr = [attributes objectAtIndex:i-1];
                    
                    if (CGRectGetMaxX(subAttr.frame)+self.itemMargin+attr.bounds.size.width+self.leftMargin>rect.size.width) {
                        attr.frame=CGRectMake(self.leftMargin, attr.frame.origin.y, attr.frame.size.width, attr.frame.size.height);
                    }else{
                        attr.frame=CGRectMake(CGRectGetMaxX(subAttr.frame)+self.itemMargin, attr.frame.origin.y, attr.frame.size.width, attr.frame.size.height);
                    }
                }else{
                    attr.frame=CGRectMake(self.leftMargin, attr.frame.origin.y, attr.frame.size.width, attr.frame.size.height);
                    
                }
                
                
            }
        }
        
    }
    
    return attributes;
}
@end
