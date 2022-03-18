//
//  GalleryVC+CollectionViewDataSource.swift
//  VKClient_АлександрЖданов
//
//  Created by Alexandru Jdanov on 07.12.2021.
//

import UIKit

extension GalleryVC: UICollectionViewDataSource {
    
    func configureCollectionView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "GalleryCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifer)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sourceArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifer, for: indexPath) as! GalleryCell
        
        cell.configure(image: UIImage(named: sourceArray[indexPath.item]), index: indexPath.item)
        return cell
    }
}
