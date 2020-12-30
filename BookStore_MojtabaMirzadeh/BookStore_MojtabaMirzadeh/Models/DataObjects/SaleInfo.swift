//
//  SaleInfo.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation
import ObjectMapper

struct SaleInfo : Mappable {
    var country : String?
    var saleability : String?
    var isEbook : Bool?
    var listPrice : ListPrice?
    var retailPrice : RetailPrice?
    var buyLink : String?
    var offers : [Offers]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        country <- map["country"]
        saleability <- map["saleability"]
        isEbook <- map["isEbook"]
        listPrice <- map["listPrice"]
        retailPrice <- map["retailPrice"]
        buyLink <- map["buyLink"]
        offers <- map["offers"]
    }

}
