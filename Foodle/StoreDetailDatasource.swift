//
//  StoreDetailDatasource.swift
//  Foodle
//
//  Created by devcraft50 on 03/07/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class StoreDetailDatasource: Datasource, JSONDecodable {
    
    let store: [Store]
    
    required init(json: JSON) throws {
        guard let storeJson = json.array else {
            throw NSError(domain: "com.foodlego", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid"])
        }
        
        self.store = storeJson.map{Store(json: $0)}
    }
}
