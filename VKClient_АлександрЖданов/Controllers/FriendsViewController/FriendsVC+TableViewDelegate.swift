//
//  FriendsViewController+TableViewDelegate.swift
//  VKClient_АлександрЖданов
//
//  Created by Alexandru Jdanov on 22.11.2021.
//

import UIKit

extension FriendsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toGallerySegue,
           let friendsFotoArray = sender as? [String],
           let destination = segue.destination as? GalleryVC {
            destination.sourceArray = friendsFotoArray
        }
    }
}
