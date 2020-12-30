//
//  Base.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation
import ObjectMapper

struct Base : Mappable {
    var kind : String?
    var totalItems : Int?
    var items : [Items]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        kind <- map["kind"]
        totalItems <- map["totalItems"]
        items <- map["items"]
    }

}
