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
    let arrayDelegate : ArrayTableViewDelegate<Element>?
    
    init(dataSource: ArrayDataSource<Element>,
         style: UITableViewStyle, title: String,
         delegate: ArrayTableViewDelegate<Element>? = nil) {
        
        self.dataSource = dataSource
        self.arrayDelegate = delegate
        super.init(style: style)
        
        self.tableView.dataSource = self.dataSource
        
        self.arrayDelegate?.viewController = self
        self.arrayDelegate?.source = dataSource
        
        self.tableView.delegate = self.arrayDelegate as? UITableViewDelegate
                
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
