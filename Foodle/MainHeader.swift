//
//  MainHeader.swift
//  Foodle
//
//  Created by devcraft50 on 26/06/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import LBTAComponents

class MainHeader: DatasourceCell {
    
    let locationButton: UIButton = {
        let button = UIButton()
        button.setTitle("잠실6동", for: .normal)
        button.setTitleColor(ColorRes.colorBlack, for: .normal)
        //button.backgroundColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.titleEdgeInsets = UIEdgeInsetsMake(5, -65, 0, 0)
        button.setImage(#imageLiteral(resourceName: "bg_select_down"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsetsMake(5, 90, 0, 0) // $$ 글자 길이에 따라서 Left 부분을 동적으로 변경 필요
        return button
    }()
    
    // $$ 슬라이드 배너로 교체 필요
    let bannerImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.backgroundColor = .green
        imageView.image = #imageLiteral(resourceName: "ad_banner_01")
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(locationButton)
        addSubview(bannerImageView)
        
        // $$ 버튼의 width 경우 글자 길이에 맞춰 동적으로 변경해줘야함
        locationButton.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 140, heightConstant: 45)
        bannerImageView.anchor(locationButton.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
}


class BannerImageView: UICollectionView {
    
    
    
    
}
