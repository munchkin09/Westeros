//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Carlos Ledesma on 18/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

final class ArrayDataSource<Element> : NSObject, UITableViewDataSource {
    
    typealias Elements = [Element]
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    private let _model : Elements
    private let _cellMake : CellMaker
    
    init(model: Elements, cellMake: @escaping CellMaker) {
        _model = model
        _cellMake = cellMake
        super.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  _cellMake(_model[indexPath.row], tableView)
        
        return cell
    }

    
    
}
