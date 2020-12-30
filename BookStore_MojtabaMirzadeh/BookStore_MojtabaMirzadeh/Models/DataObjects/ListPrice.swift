//
//  ListPrice.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation
import ObjectMapper

struct ListPrice : Mappable {
    var amountInMicros : Int?
    var currencyCode : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        amountInMicros <- map["amountInMicros"]
        currencyCode <- map["currencyCode"]
    }

}
