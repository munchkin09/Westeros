//
//  DataSources.swift
//  Westeros
//
//  Created by Carlos Ledesma on 18/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

final class DataSources {
  
    /* Aquí generamos en base al genérico ArrayDataSource el datasource para la tabla de casas */
    static func houseDataSource(model: [House]) -> ArrayDataSource<House> {
        
        let arrDS = ArrayDataSource(model: model) { (house: House, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "HouseCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            // Configure the cell...
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            
            return cell!

        }
        
        return arrDS
    }
    
    static func personDataSource(model: [Person]) -> ArrayDataSource<Person> {
        
        let arrDS = ArrayDataSource(model: model) { (person: Person, tableView: UITableView) -> UITableViewCell in
            // Configure the cell...
            let cellID = "PersonCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            // Configure the cell...
            
            cell?.textLabel?.text = person.fullName
            
            return cell!

        }
        return arrDS
    }
    
    static func seasonsDataSource(model: [Season]) -> ArrayDataSource<Season> {
        
        let arrDS = ArrayDataSource(model: model) { (season: Season, tableView: UITableView) -> UITableViewCell in
            // Configure the cell...
            let cellID = "SeasonCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            // Configure the cell...
            
            cell?.textLabel?.text = season.description
            
            return cell!
            
        }
        return arrDS
    }
    
    
    static func episodesDataSource(model: [Episode]) -> ArrayDataSource<Episode> {
        
        let arrDS = ArrayDataSource(model: model) { (episode: Episode, tableView: UITableView) -> UITableViewCell in
            // Configure the cell...
            let cellID = "EpisodeCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            // Configure the cell...
            
            cell?.textLabel?.text = episode.description
            
            return cell!
            
        }
        return arrDS
    }
    
    
    
}
