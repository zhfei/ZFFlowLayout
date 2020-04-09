//
//  ZFWaterFallLayout.swift
//  ZFFlowLayout
//
//  Created by 周飞 on 2020/4/7.
//  Copyright © 2020 zhoufei. All rights reserved.
//

import UIKit

class ZFWaterFallLayout: UICollectionViewLayout {
    //列总数
    open var columnCount = 3
    open var colunmSpacing = 20
    //行间距
    open var rowSpacing = 10
    //section到collectionView的边距
    open var sectionInset = UIEdgeInsetsMake(10, 10, -10, -10)
    //每列最大Y值
    var maxYDict:[NSNumber: NSNumber] = [NSNumber: NSNumber]()
    //保留每个item对应的attributes
    var attributesArray:[UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
    //delegate
    
    
    /// MARK:  初始化数据
    override func prepare() {
        super.prepare()
        //设置每列最大值
        for index in 1...columnCount {
            self.maxYDict.updateValue(NSNumber(value:Float(self.sectionInset.top)), forKey: NSNumber(value: index-1))
        }
        
        //收集所有cell的layoutAttributes
        let itemNum = self.collectionView?.numberOfItems(inSection: 0)
        self.attributesArray.removeAll()
        for  i in 1...itemNum! {
            let attributes = self.layoutAttributesForItem(at: IndexPath(row: i - 1, section: 0))
            if let unwrapedattributes = attributes {
                self.attributesArray.append(unwrapedattributes)
            }
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        
        
        let cvWidth = self.collectionView?.frame.size.width
        let itemWidth = (Float(cvWidth!) - Float(self.sectionInset.left*2) - Float(colunmSpacing*(columnCount-1)))/Float(columnCount)
        
        var minY = NSNumber(0)
        for (key, value) in self.maxYDict {
            if self.maxYDict[minY]!.compare(value) == ComparisonResult.orderedDescending  {
                minY = key;
            }
        }
        
        let itemX = Float(self.sectionInset.left) + (itemWidth + Float(colunmSpacing))*Float(truncating: minY)
        let itemY = Float(truncating: self.maxYDict[minY]!) + Float(self.rowSpacing)
        
        attributes.frame = CGRect(x: Double(itemX), y: Double(itemY), width: Double(itemWidth), height: Double(randomHeigh()))
        let attrY = attributes.frame.maxY
        
        self.maxYDict.updateValue(NSNumber(value: Float(attrY)), forKey: minY)
        
        return attributes
    }
    
    
    override var collectionViewContentSize: CGSize {
        get {
            let maxY = self.maxYDict.values.max { (num1, num2) -> Bool in
                return num1.floatValue > num2.floatValue
            }
            return CGSize(width: 200, height: Int(maxY!.floatValue + Float(self.sectionInset.bottom)))
        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attributesArray
    }
    
    
    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        return super.invalidationContext(forBoundsChange: newBounds)
    }
    
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let initialAtt = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath)
        //出场时动画
        return initialAtt
    }
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let finalAtt = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath)
        //消失时动画
        return finalAtt
    }
}


extension ZFWaterFallLayout {
    func randomHeigh() -> UInt32 {
        var heigh = arc4random_uniform(200)
        if heigh < 100 {
            heigh = 100
        }
        return heigh
    }
}
