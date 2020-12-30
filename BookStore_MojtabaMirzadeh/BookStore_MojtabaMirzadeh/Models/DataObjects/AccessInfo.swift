//
//  AccessInfo.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation
import ObjectMapper

struct AccessInfo : Mappable {
    var country : String?
    var viewability : String?
    var embeddable : Bool?
    var publicDomain : Bool?
    var textToSpeechPermission : String?
    var epub : Epub?
    var pdf : Pdf?
    var webReaderLink : String?
    var accessViewStatus : String?
    var quoteSharingAllowed : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        country <- map["country"]
        viewability <- map["viewability"]
        embeddable <- map["embeddable"]
        publicDomain <- map["publicDomain"]
        textToSpeechPermission <- map["textToSpeechPermission"]
        epub <- map["epub"]
        pdf <- map["pdf"]
        webReaderLink <- map["webReaderLink"]
        accessViewStatus <- map["accessViewStatus"]
        quoteSharingAllowed <- map["quoteSharingAllowed"]
    }

}
