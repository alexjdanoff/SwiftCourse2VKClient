//
//  AllGroupViewController.swift
//  VKClient_АлександрЖданов
//
//  Created by Alexandru Jdanov on 23.11.2021.
//

import UIKit

class AllGroupViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var groupsArray = [Group]()
    
    let customCellReuseIdentifier = "customCellReuseIdentifier"
    let heightCustomTableViewCell: CGFloat = 160
    let toAllGroupsSegue = "toAllGroupsSegue"
//    var coloredCellIndex = 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCellGroups", bundle: nil), forCellReuseIdentifier: customCellReuseIdentifier)
        groupFillData()

    }

}
