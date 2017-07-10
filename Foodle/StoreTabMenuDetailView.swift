//
//  StoreTabDetail.swift
//  Foodle
//
//  Created by devcraft50 on 07/07/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//
//  메뉴, 가게 정보의 상세 내용을 보여주는 Container 역할을 하는 CollectionView

import UIKit

class StoreTabMenuDetailView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .green
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var tabBar: StoreTabBar?
    
    let menuCellId = "menuCellId"
    let storeInfoCellId = "storeInfoCellId"
    
    let colors = [ColorRes.colorDeepYamiGreen, ColorRes.colorPastelRed]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 가로 스크롤로 변경하는 부분
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView.register(StoreMenuListCell.self, forCellWithReuseIdentifier: menuCellId)
        collectionView.register(StoreInfoCell.self, forCellWithReuseIdentifier: storeInfoCellId)
        
        addSubview(collectionView)
        collectionView.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width, heightConstant: 300)
        
        // 최초 로딩시 메뉴 리스트가 표시되도록 셋팅
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .bottom)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier: String
        
        if indexPath.item == 0 {
            identifier = menuCellId
        } else {
            identifier = storeInfoCellId
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) //as! UICollectionViewCell
        
        cell.backgroundColor = colors[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // 탭 아래 내용이 스크롤될 때 상단의 탭 메뉴도 같이 스크롤 될 수 있게 셋팅
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        
        tabBar?.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: .bottom)
    }
    
    // 탭 아래 내용이 스크롤될 때 상단의 탭 아래 바도 같이 스크롤 될 수 있게 셋팅
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tabBar?.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 2
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init")
    }
    
}
