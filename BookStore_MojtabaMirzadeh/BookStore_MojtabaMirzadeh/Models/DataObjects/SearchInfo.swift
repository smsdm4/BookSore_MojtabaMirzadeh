//
//  SearchInfo.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation
import ObjectMapper

struct SearchInfo : Mappable {
    var textSnippet : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        textSnippet <- map["textSnippet"]
    }

}
