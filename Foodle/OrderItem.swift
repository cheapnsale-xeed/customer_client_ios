//
//  OrderItem.swift
//  Foodle
//
//  Created by devcraft12 on 7/17/17.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import Foundation

struct OrderItem {
    var itemName: String!
    var itemCount: Int!
    var itemPrice: Int!
    
    init(itemName: String, itemCount: Int, itemPrice: Int) {
        self.itemName = itemName
        self.itemCount = itemCount
        self.itemPrice = itemPrice
    }
}
