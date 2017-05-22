//
//  ZFFlowLayoutProtocol.h
//  LeftAlignedCollectionView
//
//  Created by xuyefeng on 17/5/17.
//  Copyright © 2017年 zhoufei. All rights reserved.
//
//  策略模式：定义一个协议，不同的对象实现统一种协议，但是实现的方式不同。
//  流水布局协议

#import <Foundation/Foundation.h>
#import "ZFFlowLayoutMacro.h"

@protocol ZFFlowLayoutProtocol <NSObject>

/**
 配置布局

 @param itemEdgeInsets 左上角第一个item 距离四周的距离
 @param sectionEdgeInsets item所属的组section 距离四周的距离
 */
- (void)configFlowLayoutWithFlowLayoutItemEdgeInsets:(FlowLayoutItemEdgeInsets)itemEdgeInsets
                                   sectionEdgeInsets:(FlowLayoutSectionEdgeInsets)sectionEdgeInsets;


@end
