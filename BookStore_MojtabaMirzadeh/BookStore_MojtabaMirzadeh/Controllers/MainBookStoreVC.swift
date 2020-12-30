//
//  MainBookStoreVC.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/9/1399 AP.
//

import UIKit
import NVActivityIndicatorView
import Kingfisher
import Toast_Swift
import RealmSwift

class MainBookStoreVC: UIViewController, NVActivityIndicatorViewable {
    
    var baseResponse: Base!
    
    private var maxResult = 20
    private var startIndex = 0
    private var pageNum = 1
    
    @IBOutlet weak var booksCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBooks(getIndex: self.startIndex)

        
    }
    
    //Call Webservice
    func getBooks(getIndex: Int){
        self.startAnimating()
        WebSerivce.shared.getBooks(maxResult: self.maxResult, startIndex: getIndex) { (response, error) in
            
            if self.pageNum == 1 {
                self.baseResponse = response
            } else {
                self.baseResponse.items! += (response?.items)!
            }
                        
            DispatchQueue.main.async {
                self.booksCollectionView.delegate = self
                self.booksCollectionView.dataSource = self
                self.booksCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
                self.booksCollectionView.reloadData() // reload Collection view
            }
            
            self.stopAnimating()
            
        }
    }
    
    //NVActivityIndicatorView
    func startAnimating(){
        let size = CGSize(width: 70, height: 70)
        startAnimating(size, message: "Loading...", type: NVActivityIndicatorType.circleStrokeSpin, color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),
                       displayTimeThreshold: 4, minimumDisplayTime: 2, textColor: UIColor.white)
    }
    
}

//CollectionView
extension MainBookStoreVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (self.baseResponse.items != nil) {
            return self.baseResponse.items!.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BooksCollectionIdentifier", for: indexPath) as! MainBooksCollectionViewCell
        
        if self.baseResponse.items![indexPath.row].volumeInfo?.imageLinks?.thumbnail != nil {
            collectionCell.booksImg.kf.setImage(with:URL(string: (self.baseResponse.items![indexPath.row].volumeInfo?.imageLinks?.thumbnail)!))
        } else {
            collectionCell.booksImg.image = UIImage(named: "no-photo-available")
        }

        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (booksCollectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
         if (indexPath.row == self.baseResponse.items!.count - 1 ) { //it's last cell
            
            if self.startIndex + 20 < self.baseResponse.totalItems! {
                self.startIndex += 20
                self.pageNum += 1
            } else if self.startIndex + 20 > self.baseResponse.totalItems! {
                self.startIndex += self.baseResponse.items!.count - self.startIndex
                self.pageNum += 1
            } else if self.startIndex == self.baseResponse.totalItems! {
                self.view.makeToast("End of list", duration: 3.0, position: .center)
            }
            
            getBooks(getIndex: self.startIndex)
            
         }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsVC
        detailVC.baseResponse = self.baseResponse
        detailVC.rowNum = indexPath.row
        self.present(detailVC, animated: true, completion: nil)
        
    }
    
}

