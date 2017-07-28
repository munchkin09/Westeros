//
//  Delegates.swift
//  Westeros
//
//  Created by Carlos Ledesma on 18/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

final class GreatHousesDelegate: ArrayTableViewDelegate<House>, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let house = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController {
            let vc = HouseViewController(model: house)
            nav.pushViewController(vc, animated: true)
        }
    }
    
}
