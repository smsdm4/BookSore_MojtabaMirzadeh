//
//  Epub.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation
import ObjectMapper

struct Epub : Mappable {
    var isAvailable : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        isAvailable <- map["isAvailable"]
    }

}
