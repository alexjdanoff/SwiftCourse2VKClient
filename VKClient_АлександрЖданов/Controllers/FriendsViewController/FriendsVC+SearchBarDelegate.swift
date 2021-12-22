//
//  FriendsVC+SearchResultUptading.swift
//  VKClient_АлександрЖданов
//
//  Created by Alexandru Jdanov on 05.12.2021.
//

import UIKit


extension FriendsViewController: UISearchBarDelegate {
    
    func configureSearchBar() {
        
        friendsArray = filteredFriends
        searchBar.delegate = self
        searchBar.placeholder = "Search"
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            friendsArray = filteredFriends
        } else {
            friendsArray = filteredFriends.filter({friendsItem in
                friendsItem.name.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}
