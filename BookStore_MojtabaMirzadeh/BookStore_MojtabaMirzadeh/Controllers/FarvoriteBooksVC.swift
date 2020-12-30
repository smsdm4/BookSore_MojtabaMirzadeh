//
//  FarvoriteBooksVC.swift
//  BookStore_MojtabaMirzadeh
//
//  Created by Mojtaba Mirzadeh on 10/10/1399 AP.
//

import UIKit
import RealmSwift

class FarvoriteBooksVC: UIViewController {

    @IBOutlet weak var favoriteBooksCollectionView: UICollectionView!

    let realm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.favoriteBooksCollectionView.delegate = self
        self.favoriteBooksCollectionView.dataSource = self
        self.favoriteBooksCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }

    override func viewDidAppear(_ animated: Bool) {
        self.favoriteBooksCollectionView.reloadData()
    }
    
}

//CollectionView
extension FarvoriteBooksVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (try! Realm().objects(RealmObj.self) != nil) {
            return try! Realm().objects(RealmObj.self).count
        }else{
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteBooks", for: indexPath) as! FavoriteBooksCell

        let result = realm.objects(RealmObj.self)
        
        if result[indexPath.row].imageURL != nil {
            
            collectionCell.itemsImage.kf.setImage(with: URL(string: result[indexPath.row].imageURL!))
            
        } else {
            collectionCell.itemsImage.image = UIImage(named: "no-photo-available")
        }

        return collectionCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (favoriteBooksCollectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }

}
