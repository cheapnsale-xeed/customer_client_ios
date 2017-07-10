//
//  BannerCell.swift
//  Foodle
//
//  Created by devcraft50 on 28/06/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import LBTAComponents


class BannerCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let banner = datasourceItem as? Banner else { return }
            bannerImageView.loadImage(urlString: banner.imgSrc)
        }
    }
    
    let bannerImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "ad_banner_01")
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(bannerImageView)
        
        bannerImageView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
