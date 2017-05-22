//
//  ZFFlowLayoutMacro.h
//  LeftAlignedCollectionView
//
//  Created by xuyefeng on 17/5/17.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#ifndef ZFFlowLayoutMacro_h
#define ZFFlowLayoutMacro_h

/*!** 
 左对齐布局时：左上角第一个item 距离四周的距离
 右对齐布局时：右上角第一个item 距离四周的距离
  ***/
typedef struct FlowLayoutItemEdgeInsets {
    CGFloat top, left, bottom, right;  // specify amount to inset (positive) for each of the edges. values can be negative to 'outset'
} FlowLayoutItemEdgeInsets;

/*!** item所属的组section 距离四周的距离 ***/
typedef struct FlowLayoutSectionEdgeInsets {
    CGFloat top, left, bottom, right;  // specify amount to inset (positive) for each of the edges. values can be negative to 'outset'
} FlowLayoutSectionEdgeInsets;

#endif /* ZFFlowLayoutMacro_h */
