//
//  Items.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation
import ObjectMapper

struct Items : Mappable {
    var kind : String?
    var id : String?
    var etag : String?
    var selfLink : String?
    var volumeInfo : VolumeInfo?
    var saleInfo : SaleInfo?
    var accessInfo : AccessInfo?
    var searchInfo : SearchInfo?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        kind <- map["kind"]
        id <- map["id"]
        etag <- map["etag"]
        selfLink <- map["selfLink"]
        volumeInfo <- map["volumeInfo"]
        saleInfo <- map["saleInfo"]
        accessInfo <- map["accessInfo"]
        searchInfo <- map["searchInfo"]
    }

}
