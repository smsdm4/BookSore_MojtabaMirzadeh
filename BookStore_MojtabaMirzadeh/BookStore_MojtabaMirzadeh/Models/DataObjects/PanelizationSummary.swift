//
//  PanelizationSummary.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation
import ObjectMapper

struct PanelizationSummary : Mappable {
    var containsEpubBubbles : Bool?
    var containsImageBubbles : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        containsEpubBubbles <- map["containsEpubBubbles"]
        containsImageBubbles <- map["containsImageBubbles"]
    }

}
