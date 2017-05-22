//
//  FlowLayout.m
//  LeftAlignedCollectionView
//
//  Created by xuyefeng on 17/5/20.
//  Copyright © 2017年 zhoufei. All rights reserved.
//
//  简单工厂模式，根据不同的布局类型，生产出不同的布局方式。

#import "FlowLayout.h"
#import "FlowLayoutMacro.h"
#import "LeftAlignedFlowLayout.h"
#import "RightAlignedFlowLayout.h"

@implementation FlowLayout
+ (UICollectionViewFlowLayout *)flowLayoutWithFlowLayoutType:(FlowLayoutType)flowLayoutType {

    UICollectionViewFlowLayout <FlowLayoutProtocol> *  flowLayout = nil;
    if (flowLayoutType == FlowLayoutType_leftAlign) {
        
        flowLayout = [LeftAlignedFlowLayout new];
        [flowLayout configFlowLayoutWithFlowLayoutItemEdgeInsets:(FlowLayoutItemEdgeInsets){20,10,20,20}
                                         sectionEdgeInsets:(FlowLayoutSectionEdgeInsets){20,10,20,10}];

    } else if (flowLayoutType == FlowLayoutType_rightAlign) {
        
        flowLayout = [RightAlignedFlowLayout new];
        [flowLayout configFlowLayoutWithFlowLayoutItemEdgeInsets:(FlowLayoutItemEdgeInsets){20,10,20,20}
                                               sectionEdgeInsets:(FlowLayoutSectionEdgeInsets){20,10,20,10}];

    }
    
    
    return flowLayout;
}

@end
