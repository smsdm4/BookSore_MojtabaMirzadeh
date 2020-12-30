//
//  WebSerivce.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import Foundation
import Alamofire
import ObjectMapper

class WebSerivce {
    static let shared: WebSerivce = WebSerivce()
    
    let getURL = Config.shared.apiEndPoint
    
    func getBooks(maxResult: Int, startIndex: Int, completionHandler: @escaping (Base?, Error?) -> ()){
        
        let getBooksURL = self.getURL! + "&maxResults=\(maxResult)" + "&startIndex=\(startIndex)"
        
        AF.request(getBooksURL, method: .get, encoding: JSONEncoding.default).responseJSON { responseBooksObj in
            
            switch responseBooksObj.result {
            
            case .success(let value):

                let jsonString = String(data: responseBooksObj.data!, encoding: .utf8)!
                let responseModel = Mapper<Base>().map(JSONString: jsonString)
                
                completionHandler(responseModel,nil)
            case .failure(let error):
                completionHandler(nil,error)
                print(error)
                
            }
            
        }
        
    }
}
