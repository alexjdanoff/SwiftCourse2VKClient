//
//  GalleryVC.swift
//  VKClient_АлександрЖданов
//
//  Created by Alexandru Jdanov on 25.11.2021.
//

import UIKit

class GalleryVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var sourceArray = ["dicaprio1"]
    let reuseIdentifer = "reuseIdentifer"
    let toFullGallary = "toFullGallary"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
        self.navigationController?.delegate = self
    
    }
}
