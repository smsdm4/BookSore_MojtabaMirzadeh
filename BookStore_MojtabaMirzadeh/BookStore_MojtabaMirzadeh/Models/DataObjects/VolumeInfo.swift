//
//  VolumeInfo.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation
import ObjectMapper

struct VolumeInfo : Mappable {
    var title : String?
    var authors : [String]?
    var publisher : String?
    var description : String?
    var readingModes : ReadingModes?
    var printType : String?
    var categories : [String]?
    var maturityRating : String?
    var allowAnonLogging : Bool?
    var contentVersion : String?
    var panelizationSummary : PanelizationSummary?
    var imageLinks : ImageLinks?
    var language : String?
    var previewLink : String?
    var infoLink : String?
    var canonicalVolumeLink : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        title <- map["title"]
        authors <- map["authors"]
        publisher <- map["publisher"]
        description <- map["description"]
        readingModes <- map["readingModes"]
        printType <- map["printType"]
        categories <- map["categories"]
        maturityRating <- map["maturityRating"]
        allowAnonLogging <- map["allowAnonLogging"]
        contentVersion <- map["contentVersion"]
        panelizationSummary <- map["panelizationSummary"]
        imageLinks <- map["imageLinks"]
        language <- map["language"]
        previewLink <- map["previewLink"]
        infoLink <- map["infoLink"]
        canonicalVolumeLink <- map["canonicalVolumeLink"]
    }

}
