//
//  Attribute.m
//  LeftAlignedCollectionView
//
//  Created by zhoufei on 2017/5/19.
//  Copyright © 2017年 zhoufei. All rights reserved.
//

#import "Attribute.h"

@implementation Attribute

+ (instancetype)AttributeWithIndex:(int)index width:(float)width {

    Attribute * attribute = [Attribute new];
    
    attribute.index = index;
    attribute.width = width;
    
    return attribute;
}
@end
