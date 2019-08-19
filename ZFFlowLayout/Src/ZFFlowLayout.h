//
//  ZFFlowLayout.h
//  LeftAlignedCollectionView
//
//  Created by xuyefeng on 17/5/20.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <UIKit/UICollectionViewFlowLayout.h>
#import "ZFFlowLayoutMacro.h"
#import "ZFFlowLayoutProtocol.h"

//流水布局类型
typedef enum : NSUInteger {
    FlowLayoutType_leftAlign,
    FlowLayoutType_rightAlign,
    FlowLayoutType_axis,//轴线
    
} FlowLayoutType;

@interface ZFFlowLayout : NSObject
/*!
 *  @author zhoufei
 *
 *  @brief 根据传入不同的流失布局类型获取不同的布局实例
 *  @param flowLayoutType 流水布局类型
 *  @return 布局实例
 */
+ (UICollectionViewFlowLayout *)flowLayoutWithFlowLayoutType:(FlowLayoutType)flowLayoutType;

/*!
 *  @author zhoufei
 *
 *  @brief 自定义布局实例：根据传入不同的流失布局类型，item距离四周距离，section距离四周距离 自定义布局实例
 *  @param flowLayoutType 流水布局类型
 *  @param itemEdgeInsets 第一个item距离四周的距离
 *  @param sectionEdgeInsets section距离四周的距离
 *  @return 布局实例
 */
+ (UICollectionViewFlowLayout<ZFFlowLayoutProtocol> *)flowLayoutWithFlowLayoutType:(FlowLayoutType)flowLayoutType
                                                                    ItemEdgeInsets:(FlowLayoutItemEdgeInsets)itemEdgeInsets
                                                                 sectionEdgeInsets:(FlowLayoutSectionEdgeInsets)sectionEdgeInsets;

@end
