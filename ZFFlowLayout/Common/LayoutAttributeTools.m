//
//  LayoutAttributeTools.m
//  LeftAlignedCollectionView
//
//  Created by zhoufei on 2017/5/20.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "LayoutAttributeTools.h"
#import <UIKit/UICollectionViewFlowLayout.h>

@implementation LayoutAttributeTools
/*!
 *  @author zhoufei
 *
 *  @brief 将同一行的所有元素归并到一个组中
 *  @param attributes 所有元素数据
 *  @return 归并后的结果数组
 */
+ (NSMutableArray * )groupTheSameLineItems:(NSMutableArray * )attributes {
    
    NSMutableArray * subArray = [NSMutableArray arrayWithCapacity:attributes.count];
    NSMutableArray * currenArray = [NSMutableArray arrayWithCapacity:attributes.count];
    
    for (int i=0; i<[attributes count]; i++) {
        UICollectionViewLayoutAttributes *attr = [attributes objectAtIndex:i];
        //当类型为UICollectionElementKindCell时，修改布局
        if (attr.representedElementKind==nil) {
            
            UICollectionViewLayoutAttributes *lastAttr = [currenArray firstObject];
            if (lastAttr && lastAttr.frame.origin.y != attr.frame.origin.y) {
                [subArray addObject:[NSArray arrayWithArray:currenArray]];
                [currenArray removeAllObjects];
            }
            
            [currenArray addObject:attr];
        }
        
    }
    if (currenArray.count) {
        [subArray addObject:[NSArray arrayWithArray:currenArray]];
        [currenArray removeAllObjects];
    }
    
    return subArray;
}
@end
