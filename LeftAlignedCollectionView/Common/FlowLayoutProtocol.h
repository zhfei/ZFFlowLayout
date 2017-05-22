//
//  FlowLayoutProtocol.h
//  LeftAlignedCollectionView
//
//  Created by xuyefeng on 17/5/17.
//  Copyright © 2017年 zhoufei. All rights reserved.
//
//  流水布局协议

#import <Foundation/Foundation.h>
#import "FlowLayoutMacro.h"

@protocol FlowLayoutProtocol <NSObject>

/**
 配置布局

 @param itemEdgeInsets 左上角第一个item 距离四周的距离
 @param sectionEdgeInsets item所属的组section 距离四周的距离
 */
- (void)configFlowLayoutWithFlowLayoutItemEdgeInsets:(FlowLayoutItemEdgeInsets)itemEdgeInsets
                                   sectionEdgeInsets:(FlowLayoutSectionEdgeInsets)sectionEdgeInsets;


@end
