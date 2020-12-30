//
//  ImageLinks.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation
import ObjectMapper

struct ImageLinks : Mappable {
    var smallThumbnail : String?
    var thumbnail : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        smallThumbnail <- map["smallThumbnail"]
        thumbnail <- map["thumbnail"]
    }

}
