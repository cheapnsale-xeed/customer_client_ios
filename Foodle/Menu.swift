//
//  Menu.swift
//  Foodle
//
//  Created by devcraft50 on 29/06/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

class Menu: JSONDecodable {
    
    let menuItemCount: String
    let menuItemTotalPrice: String
    let menuId: String
    let menuName: String
    let menuPrice: Int
    let menuImg: String
    let menuDiscountPrice: Int
    let menuCategory: String
    var subMenus: [SubMenu] = []
    
    required init(json: JSON) {
        
        if let subMenusJson = json["SUB_MENUS"].array {
            for subMenu in subMenusJson  {
                self.subMenus.append(SubMenu(json: subMenu))
            }
        }
        
        self.menuItemCount = json["MENU_COUNT"].stringValue
        self.menuItemTotalPrice = json["MENU_TOTAL_PRICE"].stringValue
        self.menuId = json["MENU_ID"].stringValue
        self.menuName = json["MENU_NAME"].stringValue
        self.menuPrice = json["MENU_PRICE"].intValue
        self.menuImg = json["MENU_IMG"].stringValue
        self.menuDiscountPrice = json["MENU_DISCOUNT_PRICE"].intValue
        self.menuCategory = json["MENU_CATEGORY"].stringValue
    }
}
