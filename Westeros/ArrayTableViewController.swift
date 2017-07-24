//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Carlos Ledesma on 18/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {
    let dataSource : ArrayDataSource<Element>
    
    init(dataSource: ArrayDataSource<Element>, style: UITableViewStyle, title: String) {
        
        self.dataSource = dataSource
        
        super.init(style: style)
        
        self.title = title
        
        tableView.dataSource = self.dataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
