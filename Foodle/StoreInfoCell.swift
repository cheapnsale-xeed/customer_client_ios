//
//  StoreInfoCell.swift
//  Foodle
//
//  Created by devcraft50 on 04/07/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import UIKit
import LBTAComponents
import SwiftyJSON

class StoreInfoCell: DatasourceCell {
    
    let templabel: UILabel = {
        let label = UILabel()
        label.text = "Store Info"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        
        addSubview(templabel)
        
        templabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
