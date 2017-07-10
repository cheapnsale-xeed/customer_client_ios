//
//  StoreCell.swift
//  Foodle
//
//  Created by devcraft50 on 26/06/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import LBTAComponents
import SwiftyJSON


class StoreCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let store = datasourceItem as? Store else { return }
            storeId = store.id
            storeNameLabel.text = store.name
            prepareTimeLabel.text = "\(store.avgPrepTime)분 걸려요"
            storeImageView.loadImage(urlString: store.mainImageUrl)
            
            /*
            let menus = store.menus
            
            for menu in menus {
                print(menu.menuName)
            }
 
            let imgList = store.imgList
            
            for img in imgList {
                print(img)
            }
            */
        }
    }
        
    // Store ID
    var storeId: String = ""
    
    // Store 이름
    let storeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "매머드커피"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    // 도보 소요 시간
    let walkTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "도보 3분"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // 세로 막대
    let barView: UIView = {
        var bar = UIView()
        bar.backgroundColor = ColorRes.colorGrayBar
        bar.frame = CGRect(x: 0, y: 0, width: 2, height: 30)
        return bar
    }()
    
    // 거리
    let distanceLabel: UILabel = {
        let label = UILabel()
        label.text = "50m"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // Store 대표 이미지
    let storeImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "img_store_29")
        return imageView
    }()
    
    // 준비시간 배경 이미지
    let prepareTimeImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "time")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // 준비시간 텍스트
    let prepareTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "쉬는 시간"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(storeNameLabel)
        addSubview(walkTimeLabel)
        addSubview(barView)
        addSubview(distanceLabel)
        addSubview(storeImageView)
        addSubview(prepareTimeImageView)
        addSubview(prepareTimeLabel)
        
        storeNameLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        walkTimeLabel.anchor(storeNameLabel.bottomAnchor, left: storeNameLabel.leftAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        barView.anchor(storeNameLabel.bottomAnchor, left: walkTimeLabel.rightAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        distanceLabel.anchor(storeNameLabel.bottomAnchor, left: barView.rightAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        storeImageView.anchor(walkTimeLabel.bottomAnchor, left: storeNameLabel.leftAnchor, bottom: nil, right: nil, topConstant: 7, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: self.frame.width - 30, heightConstant: 125)
        prepareTimeImageView.anchor(storeImageView.topAnchor, left: nil, bottom: nil, right: storeImageView.rightAnchor, topConstant: -13, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        prepareTimeLabel.anchor(prepareTimeImageView.topAnchor, left: prepareTimeImageView.leftAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 17, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}
