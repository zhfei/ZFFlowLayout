//
//  AxisFlowLayout.swift
//  ZFFlowLayout
//
//  Created by 周飞 on 2018/8/14.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

class ZFAxisFlowLayout: UICollectionViewFlowLayout {
    var rightMargin:Float?//一行   距离右侧的距离
    var itemMargin:Float?//一行中 选项之间的距离
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return super.layoutAttributesForElements(in: rect)
    }
}

extension ZFAxisFlowLayout: ZFFlowLayoutProtocol {
    func configFlowLayout(with itemEdgeInsets: FlowLayoutItemEdgeInsets, sectionEdgeInsets: FlowLayoutSectionEdgeInsets) {
        
        self.rightMargin = itemEdgeInsets.right;
        self.itemMargin  = itemEdgeInsets.left;

        self.minimumInteritemSpacing = CGFloat(itemEdgeInsets.left);
        self.minimumLineSpacing = CGFloat(itemEdgeInsets.bottom);
        self.sectionInset = UIEdgeInsetsMake(CGFloat(sectionEdgeInsets.top), CGFloat(sectionEdgeInsets.left), CGFloat(sectionEdgeInsets.bottom), CGFloat(sectionEdgeInsets.right));
        self.scrollDirection = UICollectionViewScrollDirection.horizontal
    }
}
