//
//  Offers.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation
import ObjectMapper

struct Offers : Mappable {
    var finskyOfferType : Int?
    var listPrice : ListPrice?
    var retailPrice : RetailPrice?
    var giftable : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        finskyOfferType <- map["finskyOfferType"]
        listPrice <- map["listPrice"]
        retailPrice <- map["retailPrice"]
        giftable <- map["giftable"]
    }

}
