//
//  MainDatasource.swift
//  Foodle
//
//  Created by devcraft50 on 26/06/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class MainDatasource: Datasource, JSONDecodable {
    
    let stores: [Store]
    
    required init(json: JSON) throws {
        guard let storesJsonArray = json.array else {
            throw NSError(domain: "com.foodlego", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid"])
        }
        
        self.stores = storesJsonArray.map{Store(json: $0)}
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [MainHeader.self]
    }
 
    override func cellClasses() -> [DatasourceCell.Type] {
        return [StoreCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return stores[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return stores.count
    }
}
