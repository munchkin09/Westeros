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

final class PersonsDelegate: ArrayTableViewDelegate<Person>, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(indexPath)")
    }
}

final class SeasonsDelegate: ArrayTableViewDelegate<Season>, UITableViewDelegate {
   
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let season = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController {
            let episodes = season.episodes
            let epDS = DataSources.episodesDataSource(model: episodes)
            let episodesTableVC = ArrayTableViewController(dataSource: epDS,
                                                         style: .plain, title: "Episodes",
                                                         delegate: EpisodesDelegate())
            nav.pushViewController(episodesTableVC, animated: true)
        }
    }
}

final class EpisodesDelegate: ArrayTableViewDelegate<Episode>, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(indexPath)")
    }
}
