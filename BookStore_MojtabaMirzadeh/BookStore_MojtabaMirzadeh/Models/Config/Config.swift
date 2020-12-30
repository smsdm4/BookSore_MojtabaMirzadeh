//
//  Config.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation

class Config {
    static let shared : Config = Config()
    
    private var baseURL: String!
    private var apiVersion: String!
    private var apiVolumes: String!
    var apiEndPoint: String!
    
    init(){
        self.baseURL = "https://www.googleapis.com/books/"
        self.apiVersion = "v1/"
        self.apiVolumes = "volumes?q=ios"
        self.apiEndPoint = baseURL + apiVersion + apiVolumes
    }
}
