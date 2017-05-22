//
//  FlowLayout.h
//  LeftAlignedCollectionView
//
//  Created by xuyefeng on 17/5/20.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <UIKit/UICollectionViewFlowLayout.h>


typedef enum : NSUInteger {
    FlowLayoutType_leftAlign,
    FlowLayoutType_rightAlign,
} FlowLayoutType;

@interface FlowLayout : NSObject

+ (UICollectionViewFlowLayout *)flowLayoutWithFlowLayoutType:(FlowLayoutType)flowLayoutType;

@end
