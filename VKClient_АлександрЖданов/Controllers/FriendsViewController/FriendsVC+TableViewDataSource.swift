//
//  FriendsViewController+TableViewDataSource.swift
//  VKClient_АлександрЖданов
//
//  Created by Alexandru Jdanov on 22.11.2021.
//

import UIKit

extension FriendsViewController: UITableViewDataSource {
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCellFriends", bundle: nil), forCellReuseIdentifier: customCellReuseIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellReuseIdentifier, for: indexPath) as? CustomTableViewCellFriends else {return UITableViewCell()}

        cell.configure(friend: friendsArray[indexPath.row], clusure: {[weak self] in
            if let self = self,
               let friendsFotoArray = self.friendsArray[indexPath.row].fotoArray {
                self.performSegue(withIdentifier: self.toGallerySegue, sender: friendsFotoArray)
            }
        })
        return cell
    }

}
