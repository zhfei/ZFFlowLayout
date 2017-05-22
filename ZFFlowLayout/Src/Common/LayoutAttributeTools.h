//
//  LayoutAttributeTools.h
//  LeftAlignedCollectionView
//
//  Created by zhoufei on 2017/5/20.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LayoutAttributeTools : NSObject
/*!
 *  @author zhoufei
 *
 *  @brief 将同一行的所有元素归并到一个组中
 *  @param attributes 所有元素数据
 *  @return 归并后的结果数组
 */
+ (NSMutableArray * )groupTheSameLineItems:(NSMutableArray * )attributes;
@end
