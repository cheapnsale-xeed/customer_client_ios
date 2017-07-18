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


var myStore: Store?

struct Service {
    
    let basicURL = TRON(baseURL: "https://cv47nyx5yl.execute-api.ap-northeast-1.amazonaws.com/prod")
    
    static let sharedInstance = Service()
    
    
    // 메인화면var Store 리스트 가져오기
    func fetchMainFeed(completion: @escaping (MainDatasource?, Error?) -> ()) {
        let request: APIRequest<MainDatasource, JSONError> = basicURL.request("/stores")
        
        request.perform(withSuccess: { (mainDatasource) in
            print("Successfully fetched main our json objects")
            
            completion(mainDatasource, nil)
            
        }) { (err) in
            completion(nil, err)
        }
    }
    
    // 배너 광고 데이터 가져오기
    func fetchBannerFeed(completion: @escaping (BannerDatasource?, Error?) -> ()) {
        let request: APIRequest<BannerDatasource, JSONError> = basicURL.request("/app/banner")
        request.method = .post
        
        request.perform(withSuccess: { (bannerDatasource) in
            print("Successfully fetched our banner json objects")
            
            completion(bannerDatasource, nil)
            
        }) { (err) in
            completion(nil, err)
        }
    }
    
    
    // Store 데이터 가져오기
    func fetchStoreDetail(id: String) -> APIRequest<Store, JSONError> {
        return basicURL.request("/store/\(id)")
    }
    
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
    // Store Menu 서브 출력용 가공 작업
    func arrangeStoreMenu(_ menus: [Menu]) -> NSMutableArray {
        var menuCategory: String?
        let categoryAddedMenus: NSMutableArray = []
        
        for menu in menus {
            if (menu.menuCategory == "N/A") {
                let tempArray:NSMutableArray = menus as! NSMutableArray
                return (tempArray)
            }
            
            if menuCategory != nil {
                
                if menuCategory == menu.menuCategory {
                    menuCategory = menu.menuCategory
                    menu.menuCategory = "N/A"
                    categoryAddedMenus.add(menu) // 이전 Category와 같은 경우 메뉴만 추가
                } else {
                    menuCategory = menu.menuCategory
                    categoryAddedMenus.add(menu.menuCategory) // category용 추가
                    menu.menuCategory = "N/A"
                    categoryAddedMenus.add(menu) // 메뉴용 추가
                }
                
            } else {
                menuCategory = menu.menuCategory
                categoryAddedMenus.add(menu.menuCategory) // category용 추가
                menu.menuCategory = "N/A"
                categoryAddedMenus.add(menu) // 메뉴용 추가
            }
        }
        
        return categoryAddedMenus
    }
    
}
