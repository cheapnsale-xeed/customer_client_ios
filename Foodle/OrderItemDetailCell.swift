//
//  OrderItemDetailCell.swift
//  Foodle
//
//  Created by devcraft12 on 7/17/17.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import LBTAComponents
import SwiftyJSON

class OrderItemDetailCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            
        }
    }
    
    let itemNameLabel: UILabel = {
        let label = UILabel()
        label.text = "놀부보쌈"
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "15,000"
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    let itemCountLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(itemNameLabel)
        addSubview(itemPriceLabel)
        addSubview(itemCountLabel)
        
        itemNameLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        itemCountLabel.anchor(self.topAnchor, left: self.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        itemPriceLabel.anchor(self.topAnchor, left: nil, bottom: nil, right: itemCountLabel.leftAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
    }
}
