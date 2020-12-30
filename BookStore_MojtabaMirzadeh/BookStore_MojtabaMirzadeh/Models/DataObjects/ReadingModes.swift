//
//  ReadingModes.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation
import ObjectMapper

struct ReadingModes : Mappable {
    var text : Bool?
    var image : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        text <- map["text"]
        image <- map["image"]
    }

}
