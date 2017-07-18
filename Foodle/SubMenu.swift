//
//  SubMenu.swift
//  Foodle
//
//  Created by devcraft50 on 29/06/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

class SubMenu: JSONDecodable {
    
    let subMenuName: String
    let subMenuPrice: Int
    let subMenuType: String    
    
    required init(json: JSON) {
        self.subMenuName = json["SUB_MENU_NAME"].stringValue
        self.subMenuPrice = json["SUB_MENU_PRICE"].intValue
        self.subMenuType = json["SUB_MENU_TYPE"].stringValue
    }
}
