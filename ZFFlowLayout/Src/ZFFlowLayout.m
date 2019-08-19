//
//  ZFFlowLayout.m
//  LeftAlignedCollectionView
//
//  Created by xuyefeng on 17/5/20.
//  Copyright © 2017年 zhoufei. All rights reserved.
//
//  简单工厂模式，根据不同的布局类型，生产出不同的布局方式。

#import "ZFFlowLayout.h"
#import "LeftAlignedFlowLayout.h"
#import "RightAlignedFlowLayout.h"
#import "ZFFlowLayout-Swift.h"

@implementation ZFFlowLayout
+ (UICollectionViewFlowLayout *)flowLayoutWithFlowLayoutType:(FlowLayoutType)flowLayoutType {
    UICollectionViewFlowLayout <ZFFlowLayoutProtocol> *  flowLayout = nil;
    flowLayout = [self flowLayoutWithFlowLayoutType:flowLayoutType
                                     ItemEdgeInsets:(FlowLayoutItemEdgeInsets){20,10,20,20}
                                  sectionEdgeInsets:(FlowLayoutSectionEdgeInsets){20,10,20,10}];
    
    return flowLayout;
}

+ (UICollectionViewFlowLayout<ZFFlowLayoutProtocol> *)flowLayoutWithFlowLayoutType:(FlowLayoutType)flowLayoutType
                                                                    ItemEdgeInsets:(FlowLayoutItemEdgeInsets)itemEdgeInsets
                                                                 sectionEdgeInsets:(FlowLayoutSectionEdgeInsets)sectionEdgeInsets {
    UICollectionViewFlowLayout <ZFFlowLayoutProtocol> *  flowLayout = nil;
    if (flowLayoutType == FlowLayoutType_leftAlign) {
        flowLayout =  [LeftAlignedFlowLayout new];
    } else if (flowLayoutType == FlowLayoutType_rightAlign) {
        flowLayout =  [RightAlignedFlowLayout new];
    } else if (flowLayoutType == FlowLayoutType_axis) {
        flowLayout =  [ZFAxisFlowLayout new];
    }
    [flowLayout configFlowLayoutWithFlowLayoutItemEdgeInsets:itemEdgeInsets
                                           sectionEdgeInsets:sectionEdgeInsets];
    
    return flowLayout;
}

@end
