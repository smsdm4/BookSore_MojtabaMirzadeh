//
//  DetailsVC.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import UIKit
import Toast_Swift
import RealmSwift

class DetailsVC: UIViewController {
    
    let realm = try! Realm()
    
    var baseResponse: Base!
    var rowNum: Int!
    var bookmarkFlag = false
    
    @IBOutlet weak var bookImgView: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookDescription: UILabel!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var bookmarkBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVC()
        
        if checkingIsFavorite() == true {
            self.bookmarkBtn.setImage(UIImage(named: "Star-Favorite-Disable-Off-Inactive"), for: .normal)
            self.bookmarkFlag = true
        }
        
    }
    
    func initVC(){
        
        if self.baseResponse.items![rowNum].volumeInfo?.imageLinks?.thumbnail != nil{
            let url = URL(string: (self.baseResponse.items![rowNum].volumeInfo?.imageLinks?.thumbnail)!)
            let data = try? Data(contentsOf: url!)
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                self.bookImgView.image = image
            }
        } else {
            self.bookImgView.image = UIImage(named: "no-photo-available")
        }
        
        self.bookTitle.text = self.baseResponse.items![rowNum].volumeInfo?.title
        
        let authors = self.baseResponse.items![rowNum].volumeInfo?.authors
        if authors != nil {
            self.bookAuthor.text = authors!.joined(separator: " & ")
        }
        
        self.bookDescription.text = self.baseResponse.items![rowNum].volumeInfo?.description
        
    }
    
    func checkingIsFavorite()-> Bool{
        let result = realm.objects(RealmObj.self)
        
        for id in 0..<result.count {
            if result[id].id == self.baseResponse.items![rowNum].id {
                return true
            }
        }
        return false
    }
    
    func realmAddObjs() {
        
        let realmObj = RealmObj()
        realmObj.id = self.baseResponse.items![rowNum].id
        realmObj.imageURL = self.baseResponse.items![rowNum].volumeInfo?.imageLinks?.thumbnail
        realmObj.title = self.baseResponse.items![rowNum].volumeInfo?.title
        
        let authors = self.baseResponse.items![rowNum].volumeInfo?.authors
        if authors != nil {
            realmObj.autors = authors!.joined(separator: " & ")
        }
        
        realmObj.desc = self.baseResponse.items![rowNum].volumeInfo?.description
        realmObj.buyLink = self.baseResponse.items![rowNum].saleInfo?.buyLink
        
        
        try! realm.write {
            realm.add(realmObj)
        }
        
    }
    
    func realmDeleteObjs(){
        
        let id = (self.baseResponse.items![rowNum].id)!
        let result = realm.objects(RealmObj.self).filter("id = '\(id)'")
        
        try! realm.write {
            realm.delete(result)
        }
        
    }
    
    @IBAction func bookmarkBtnPressed(_ sender: Any) {
        if self.bookmarkFlag == false {
            self.bookmarkFlag = true
            self.bookmarkBtn.setImage(UIImage(named: "Star-Favorite-Disable-Off-Inactive"), for: .normal)
            realmAddObjs()
        } else {
            self.bookmarkFlag = false
            self.bookmarkBtn.setImage(UIImage(named: "favorite_star_rate_like_bookmark"), for: .normal)
            realmDeleteObjs()
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buyBtnPressed(_ sender: Any) {
        
        if self.baseResponse.items![rowNum].saleInfo?.isEbook == true {
            guard let url = URL(string: (self.baseResponse.items![rowNum].saleInfo?.buyLink)!) else { return }
            UIApplication.shared.open(url)
        } else {
            self.view.makeToast("Not available", duration: 3.0, position: .center)
        }
        
    }
    
}
