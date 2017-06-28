//
//  Banner.swift
//  Foodle
//
//  Created by devcraft50 on 28/06/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Banner {
    
    let id: String
    let imgSrc: String
    let type: String
    let storeId: String
    
    init(json: JSON) {
        self.id = json["ID"].stringValue
        self.imgSrc = json["IMAGE_SRC"].stringValue
        self.type = json["TYPE"].stringValue
        self.storeId = json["STORE_ID"].stringValue
    }
}
