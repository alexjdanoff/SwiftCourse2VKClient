//
//  GalleryVC+CollectionViewDelegate.swift
//  VKClient_АлександрЖданов
//
//  Created by Alexandru Jdanov on 07.12.2021.
//

import UIKit

extension GalleryVC: UICollectionViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toFullGallary,
           let image = sender as? String,
           let destination = segue.destination as? FullGalleryVC {
            destination.newImage = image
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: toFullGallary, sender: sourceArray[indexPath.row])
        
    }
}

extension GalleryVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.bounds.width
        let whiteSpace = CGFloat(0)
        let lineCountCell = CGFloat(3)
        let cellWidth = collectionViewWidth / lineCountCell - whiteSpace
        
        return CGSize(width: cellWidth, height: cellWidth)
    }
}
