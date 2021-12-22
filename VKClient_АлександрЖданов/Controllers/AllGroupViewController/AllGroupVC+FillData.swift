//
//  AllGroupVC+FillData.swift
//  VKClient_АлександрЖданов
//
//  Created by Alexandru Jdanov on 08.12.2021.
//

import UIKit

extension AllGroupViewController {
    
    func groupFillData() {
        let groupOne = Group(name: "Сar enthusiasts", avatar: "avtolb4")
        let groupTwo = Group(name: "Basketball fans", avatar: "basket1")
        let groupThree = Group(name: "IT world", avatar: "it1")
        let groupFour = Group(name: "Nails", avatar: "nails1")
        let groupFive = Group(name: "Shopping", avatar: "shopping1")
        
        groupsArray.append(groupOne)
        groupsArray.append(groupTwo)
        groupsArray.append(groupThree)
        groupsArray.append(groupFour)
        groupsArray.append(groupFive)
    }
}
