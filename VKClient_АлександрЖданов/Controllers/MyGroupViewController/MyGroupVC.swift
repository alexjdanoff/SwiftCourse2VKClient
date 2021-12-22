//
//  MyGroupViewController.swift
//  VKClient_АлександрЖданов
//
//  Created by Alexandru Jdanov on 22.11.2021.
//

import UIKit

class MyGroupViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var groupsArray = [Group]()
    
    let customCellReuseIdentifier = "customCellReuseIdentifier"
    let heightCustomTableViewCell: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCellGroups", bundle: nil), forCellReuseIdentifier: customCellReuseIdentifier)
        NotificationCenter.default.addObserver(self, selector: #selector(addGroup(_:)), name: Notification.Name("groupSelectedNotification"), object: nil)
    }
    
    @objc func addGroup(_ notification: Notification) {
        guard let groupObject = notification.object as? Group else {return}
        
        if groupsArray.contains(where: {sourceGroup in
            sourceGroup.name == groupObject.name
        }) {
            let alert = UIAlertController(title: "Ошибка", message: "Вы уже состоите в данной группе", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil);            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            groupsArray.append(groupObject)
            tableView.reloadData()
            
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
