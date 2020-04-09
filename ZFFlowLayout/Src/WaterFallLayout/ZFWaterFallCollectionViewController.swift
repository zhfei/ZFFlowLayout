//
//  ZFWaterFallCollectionViewController.swift
//  ZFFlowLayout
//
//  Created by 周飞 on 2020/4/7.
//  Copyright © 2020 zhoufei. All rights reserved.
//

import UIKit

let collectionViewCellID = "UICollectionViewCell";

class ZFWaterFallCollectionViewController: UICollectionViewController {
    
    var dataSourceArray = [String]()
    
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellID)
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        
        setupData()
        setupUI()
        
    }
    
    func setupUI() {
        self.collectionView?.backgroundColor = .white
        
        let reloadBtn = UIButton(type: UIButtonType.custom)
        reloadBtn.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
        reloadBtn.setTitle("reloadData", for: UIControlState.normal)
        reloadBtn.setTitleColor(.blue, for: .normal)
        reloadBtn.addTarget(self, action: #selector(reloadDataBtnAction(btnItem:)), for: UIControlEvents.touchUpInside)
        let reloadBtnItem = UIBarButtonItem(customView: reloadBtn)

        
        let invalidateLayoutBtn = UIButton(type: UIButtonType.custom)
        invalidateLayoutBtn.bounds = CGRect(x: 0, y: 0, width: 80, height: 50)
        invalidateLayoutBtn.setTitle("invalidateLayout", for: UIControlState.normal)
        invalidateLayoutBtn.setTitleColor(.blue, for: .normal)
        invalidateLayoutBtn.addTarget(self, action: #selector(invalidateLayoutBtnAction(btnItem:)), for: UIControlEvents.touchUpInside)
        let invalidateLayoutBtnItem = UIBarButtonItem(customView: invalidateLayoutBtn)
        
        
        let deleteLayoutBtn = UIButton(type: UIButtonType.custom)
        deleteLayoutBtn.bounds = CGRect(x: 0, y: 0, width: 80, height: 50)
        deleteLayoutBtn.setTitle("delete", for: UIControlState.normal)
        deleteLayoutBtn.setTitleColor(.blue, for: .normal)
        deleteLayoutBtn.addTarget(self, action: #selector(deleteBtnAction(btnItem:)), for: UIControlEvents.touchUpInside)
        let deleteLayoutBtnItem = UIBarButtonItem(customView: deleteLayoutBtn)


        self.navigationItem.rightBarButtonItems = [invalidateLayoutBtnItem,reloadBtnItem,deleteLayoutBtnItem]
    }
    
    @objc func invalidateLayoutBtnAction(btnItem: UIButton) {
        self.collectionView?.collectionViewLayout.invalidateLayout()
        //会对当前位置移除旧的cell，创建一个新的cell
//        self.collectionView?.reloadItems(at: [IndexPath(row: 1, section: 0)])
    }
    
    @objc func reloadDataBtnAction(btnItem: UIButton) {
        self.collectionView?.reloadData()
    }
    
    @objc func deleteBtnAction(btnItem: UIButton) {
        //只调用此方法，不会执行reloadData(),只会执行invalidateLayout()
        self.collectionView?.performBatchUpdates({
            //delete 不会reloadData
            var array = [IndexPath]()
            var count = 1
            while count > 0 {
                array.append(IndexPath(item: count, section: 0))
                self.dataSourceArray.remove(at: count)
                count -= 1
            }
            self.collectionView?.deleteItems(at: array)
            
//            //会reloadData被Insert的那个cell
//            var array1 = [IndexPath]()
//            var count1 = 2
//            while count1 > 1 {
//                array1.append(IndexPath(item: count1, section: 0))
//                self.dataSourceArray.insert("a", at: count1)
//                count1 -= 1
//            }
//            self.collectionView?.insertItems(at: array1)
            
        }, completion: { (complete) in
//            self.collectionView?.collectionViewLayout.invalidateLayout()
//            //会对当前位置移除旧的cell，创建一个新的cell
//            //同时会reload指定的cell
//            self.collectionView?.reloadItems(at: [IndexPath(row: 1, section: 0)])
        })
    }
    
    func setupData()  {
        for index in 0...50 {
            self.dataSourceArray.append(String(format: "%d", index))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ZFWaterFallCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSourceArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellID, for: indexPath)

        if cell.contentView.subviews.count == 0 {
            cell.backgroundColor = UIColor.init(red: randomColor(), green: randomColor(), blue: randomColor(), alpha: 1)
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
            label.text = String(format: "编号:%d", indexPath.row)
            cell.contentView.addSubview(label)
            
            let contextLabel = UILabel(frame: CGRect(x: 0, y: 70, width: 80, height: 30))
            contextLabel.tag = 10
            contextLabel.text = "内容"
            cell.contentView.addSubview(contextLabel)
        }
        
        let contextLabel = cell.contentView.viewWithTag(10) as! UILabel
        contextLabel.text = String(format: "内容: %d", indexPath.row)
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ZFWaterFallCollectionViewController {
    func randomColor() -> CGFloat {
        return CGFloat(Double(arc4random_uniform(100))*0.01)
    }
}



