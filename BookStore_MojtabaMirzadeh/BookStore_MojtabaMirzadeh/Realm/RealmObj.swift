//
//  RealmObj.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/10/1399 AP.
//

import Foundation
import RealmSwift

class RealmObj: Object {
    
    @objc dynamic var id: String?
    @objc dynamic var imageURL: String?
    @objc dynamic var title: String?
    @objc dynamic var autors: String?
    @objc dynamic var desc: String?
    @objc dynamic var buyLink: String?
    
}
