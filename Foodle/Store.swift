//
//  Store.swift
//  Foodle
//
//  Created by devcraft50 on 27/06/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

class Store: JSONDecodable {
    
    let id: String
    let category: String
    let regNum: String
    let name: String
    let paymentType: String
    let avgPrepTime: String
    let mainImageUrl: String
    var menus: [Menu] = []
    let phoneNumber: String
    let gpsCoordinatesLat: Double
    let gpsCoordinatesLong: Double
    let openTime: String
    let closeTime: String
    let address: String
    let endTime: String
    let recommendCount: Int
    let storeInfo: String
    let operatingInfo: String
    let breakTime: String
    let parkInfo: String
    let webSite: String
    let posTime: String
    var imgList: [String] = []
    let closedStoreInfo: String
    let endTimeInfo: String
    //let operatingTimes: Any
    let breakTimeInfo: String
    let storeStatus: String
    let showDiscountPrice: String
    let newStore: String
    
    
    required init(json: JSON) {
        
        if let menusJson = json["MENUS"].array {
            for menu in menusJson  {
                self.menus.append(Menu(json: menu))
            }
        }
        
        if let storeImgList = json["IMG_LIST"].array {
            for img in storeImgList {
                self.imgList.append(String(json: img))
            }
        }
        
        self.id = json["ID"].stringValue
        self.category = json["CATEGORY"].stringValue
        self.regNum = json["REG_NUM"].stringValue
        self.name = json["NAME"].stringValue
        self.paymentType = json["PAYMENT_TYPE"].stringValue
        self.avgPrepTime = json["AVG_PREP_TIME"].stringValue
        self.mainImageUrl = json["MAIN_IMG"].stringValue
        self.phoneNumber = json["PHONE"].stringValue
        self.gpsCoordinatesLat = json["GPS_COORDINATES_LAT"].doubleValue
        self.gpsCoordinatesLong = json["GPS_COORDINATES_LONG"].doubleValue
        self.openTime = json["OPEN_TIME"].stringValue
        self.closeTime = json["CLOSE_TIME"].stringValue
        self.address = json["ADDRESS"].stringValue
        self.endTime = json["END_TIME"].stringValue
        self.recommendCount = json["RECOMMEND_COUNT"].intValue
        self.storeInfo = json["STORE_INFO"].stringValue
        self.operatingInfo = json["OPERATING_INFO"].stringValue
        self.breakTime = json["BREAK_TIME"].stringValue
        self.parkInfo = json["PARK_INFO"].stringValue
        self.webSite = json["WEB_SITE"].stringValue
        self.posTime = json["POS_TIME"].stringValue
        self.closedStoreInfo = json["CLOSED_STORE_INFO"].stringValue
        self.endTimeInfo = json["END_TIME_INFO"].stringValue
        //self.operatingTimes: Any
        self.breakTimeInfo = json["BREAK_TIME_INFO"].stringValue
        self.storeStatus = json["STORE_STATUS"].stringValue
        self.showDiscountPrice = json["SHOW_DISCOUNT_PRICE"].stringValue
        self.newStore = json["NEW_STORE"].stringValue
    }
}
