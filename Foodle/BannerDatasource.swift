//
//  BannerDatasource.swift
//  Foodle
//
//  Created by devcraft50 on 28/06/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class BannerDatasource: Datasource, JSONDecodable {
    
    let banners: [Banner]
    
    required init(json: JSON) throws {
        guard let bannersJsonArray = json.array else {
            throw NSError(domain: "com.foodlego", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid"])
        }
        
        self.banners = bannersJsonArray.map{Banner(json: $0)}
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [BannerCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return banners[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return banners.count
    }
    
}
