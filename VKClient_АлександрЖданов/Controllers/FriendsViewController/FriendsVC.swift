//
//  FriendsViewController.swift
//  VKClient_АлександрЖданов
//
//  Created by Alexandru Jdanov on 22.11.2021.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var friendsArray = [Friend]()
    var filteredFriends = [Friend]()
    
    let customCellReuseIdentifier = "customCellReuseIdentifier"
    let heightCustomTableViewCell: CGFloat = 50
    let toGallerySegue = "toGallerySegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fillFriendsArray()
        configureSearchBar()
    }
}



