//
//  StoreInfoCell.swift
//  Foodle
//
//  Created by devcraft50 on 04/07/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//
//  가게정보 Cell

import UIKit
import LBTAComponents
import SwiftyJSON

class StoreInfoCell: DatasourceCell {
    
    var store: Store?
    
    let storeIntroTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "매장소개"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let storeIntroContentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "이 매장 음식은 조선시대 임금님이 먹던 음식으로써...임금님 음식을 누려봐~"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let operatingTimeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "매장영업시간"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let operatingTimeContentLabel: UILabel =  {
        let label = UILabel()
        label.text = "우리에겐 휴식이란 사치다"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .right
        return label
    }()
    
    let foodleTimeTitleLabel: UILabel =  {
        let label = UILabel()
        label.text = "푸들가능시간"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let foodleTimeContentLabel: UILabel =  {
        let label = UILabel()
        label.text = "배고플땐 언제나 푸들 가능"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .right
        return label
    }()
    
    let breakTimeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "쉬는시간"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let breakTimeContentLabel: UILabel =  {
        let label = UILabel()
        label.text = "좀 쉬었다 갑시다"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .right
        return label
    }()
    
    let closeTimeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "휴무"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let closeTimeContentLabel: UILabel =  {
        let label = UILabel()
        label.text = "쉬는날도 있어야지"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .right
        return label
    }()
    
    let categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "음식분류"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let categoryContentLabel: UILabel =  {
        let label = UILabel()
        label.text = "한식/중식/양식/일식 중 일식이 최고니라"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()
    
    let carParkTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "주차정보"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let carParkContentLabel: UILabel =  {
        let label = UILabel()
        label.text = "주차금지"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()

    let webSiteTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "웹사이트"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let webSiteContentLabel: UILabel =  {
        let label = UILabel()
        label.text = "주차금지"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.store = myStore
        let rightPadding: CGFloat = 15
        let topPadding: CGFloat = 13
        
        
        // 내용 셋팅
        storeIntroContentLabel.text = self.store?.storeInfo
        operatingTimeContentLabel.text = self.store?.operatingInfo
        foodleTimeContentLabel.text = self.store?.endTimeInfo
        breakTimeContentLabel.text = self.store?.breakTimeInfo
        closeTimeContentLabel.text = self.store?.closedStoreInfo
        categoryContentLabel.text = self.store?.category
        carParkContentLabel.text = self.store?.parkInfo
        webSiteContentLabel.text = self.store?.webSite
        
        // View 추가
        addSubview(storeIntroTitleLabel)
        addSubview(storeIntroContentLabel)
        addSubview(operatingTimeTitleLabel)
        addSubview(operatingTimeContentLabel)
        addSubview(foodleTimeTitleLabel)
        addSubview(foodleTimeContentLabel)
        addSubview(breakTimeTitleLabel)
        addSubview(breakTimeContentLabel)
        addSubview(closeTimeTitleLabel)
        addSubview(closeTimeContentLabel)
        addSubview(categoryTitleLabel)
        addSubview(categoryContentLabel)
        addSubview(carParkTitleLabel)
        addSubview(carParkContentLabel)
        addSubview(webSiteTitleLabel)
        addSubview(webSiteContentLabel)
        
        // 위치 셋팅
        storeIntroTitleLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        storeIntroContentLabel.anchor(storeIntroTitleLabel.bottomAnchor, left: storeIntroTitleLabel.leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: rightPadding, widthConstant: 0, heightConstant: 0)
        operatingTimeTitleLabel.anchor(storeIntroContentLabel.bottomAnchor, left: storeIntroTitleLabel.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        operatingTimeContentLabel.anchor(operatingTimeTitleLabel.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: rightPadding, widthConstant: 0, heightConstant: 0)
        foodleTimeTitleLabel.anchor(operatingTimeContentLabel.bottomAnchor, left: storeIntroTitleLabel.leftAnchor, bottom: nil, right: nil, topConstant: topPadding, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        foodleTimeContentLabel.anchor(foodleTimeTitleLabel.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: rightPadding, widthConstant: 0, heightConstant: 0)
        breakTimeTitleLabel.anchor(foodleTimeContentLabel.bottomAnchor, left: storeIntroTitleLabel.leftAnchor, bottom: nil, right: nil, topConstant: topPadding, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        breakTimeContentLabel.anchor(breakTimeTitleLabel.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: rightPadding, widthConstant: 0, heightConstant: 0)
        closeTimeTitleLabel.anchor(breakTimeContentLabel.bottomAnchor, left: storeIntroTitleLabel.leftAnchor, bottom: nil, right: nil, topConstant: topPadding, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        closeTimeContentLabel.anchor(closeTimeTitleLabel.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: rightPadding, widthConstant: 0, heightConstant: 0)
        categoryTitleLabel.anchor(closeTimeContentLabel.bottomAnchor, left: storeIntroTitleLabel.leftAnchor, bottom: nil, right: nil, topConstant: topPadding, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        categoryContentLabel.anchor(categoryTitleLabel.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: rightPadding, widthConstant: 0, heightConstant: 0)
        carParkTitleLabel.anchor(categoryContentLabel.bottomAnchor, left: storeIntroTitleLabel.leftAnchor, bottom: nil, right: nil, topConstant: topPadding, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        carParkContentLabel.anchor(carParkTitleLabel.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: rightPadding, widthConstant: 0, heightConstant: 0)
        webSiteTitleLabel.anchor(carParkContentLabel.bottomAnchor, left: storeIntroTitleLabel.leftAnchor, bottom: nil, right: nil, topConstant: topPadding, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        webSiteContentLabel.anchor(webSiteTitleLabel.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: rightPadding, widthConstant: 0, heightConstant: 0)
        
    }
}
