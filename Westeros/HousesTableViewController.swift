//
//  HousesTableViewController.swift
//  Westeros
//
//  Created by Carlos Ledesma on 17/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

class HousesTableViewController: UITableViewController {
    
    let model : [House]
    
    init(model: [House]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Houses of Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let house = model[indexPath.row]
        
        let cellID = "HouseCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
           cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }

        // Configure the cell...
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name

        return cell!
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let house = model[indexPath.row]
        let houseVC = HouseViewController(model: house)
        navigationController?.pushViewController(houseVC, animated: true)
    }
}
