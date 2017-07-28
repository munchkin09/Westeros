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
        
        //Siempre hacemos las asignaciones de nuestras variables 1º
        self.dataSource = dataSource
        self.arrayDelegate = delegate
        
        //Después de nuestras asignaciones super.init para terminar de instanciar el objeto
        super.init(style: style)
        
        //Luego se hacen las configuraciones necesarias de la clase:
        
        //Le decimos a la tabla quién va a ser su datasource
        self.tableView.dataSource = self.dataSource
        
        self.arrayDelegate?.viewController = self
        
        //Le decimos a nuestro DelegadoGenérico quién será su datasource
        self.arrayDelegate?.source = dataSource
        
        //Le decimos a la tabla quién será su delegado
        self.tableView.delegate = self.arrayDelegate as? UITableViewDelegate
                
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
