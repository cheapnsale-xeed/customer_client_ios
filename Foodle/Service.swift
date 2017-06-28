//
//  Service.swift
//  Foodle
//
//  Created by devcraft50 on 27/06/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let basicURL = TRON(baseURL: "https://cv47nyx5yl.execute-api.ap-northeast-1.amazonaws.com/prod/")
    
    static let sharedInstance = Service()
    
    func fetchMainFeed(completion: @escaping (MainDatasource?, Error?) -> ()) {
        let request: APIRequest<MainDatasource, JSONError> = basicURL.request("/stores")
        
        request.perform(withSuccess: { (mainDatasource) in
            print("Successfully fetched our json objects")
            
            completion(mainDatasource, nil)
            
        }) { (err) in
            completion(nil, err)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
}
