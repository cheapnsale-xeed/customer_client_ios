//
//  StoreMenuCell.swift
//  Foodle
//
//  Created by devcraft50 on 04/07/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class StoreMenuTabCell: BaseCell {
    
    let labelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = ColorRes.colorGray
        label.textAlignment = .center
        return label
    }()
    
    
    override var isHighlighted: Bool {
        didSet {
            labelView.textColor = isHighlighted ? ColorRes.colorBlack : ColorRes.colorGray
        }
    }
    
    override var isSelected: Bool {
        didSet {
            labelView.textColor = isSelected ? ColorRes.colorBlack : ColorRes.colorGray
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(labelView)
        
        labelView.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: self.frame.width, heightConstant: 0)
    }
    
}
