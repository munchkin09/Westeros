//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by Carlos Ledesma on 18/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit


final class ArrayTableViewDelegate<Element>: NSObject, UITableViewDelegate {
    
    typealias Elements = [Element]
    
    let model : Elements
    
    init(model: Elements) {
        self.model = model
        
        super.init()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = model[indexPath.row]
        let houseVC = HouseViewController(model: house)
        
    }
}

