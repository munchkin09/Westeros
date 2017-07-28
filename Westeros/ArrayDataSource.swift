//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Carlos Ledesma on 18/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit


/*  
    Esta clase recibe un tipo de dato(Element) y actúa como su fuente de datos(dataSource)
    respondiendo a las funciones que UITableViewDataSource nos pide.
    Usa una clausura en el método tableView cellForRowAt para la construcción de la celda
 */
final class ArrayDataSource<Element> : NSObject, UITableViewDataSource {
    
    typealias Elements = [Element]
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    private let _model : Elements
    private let _cellMaker : CellMaker
    
    // @escaping indica que la clausura no será ejecutada inmediatamente en esta función
    init(model: Elements, cellMaker: @escaping CellMaker) {
        _model = model
        _cellMaker = cellMaker
        super.init()
    }
    
    //Usamos esta función para devolver el objeto concreto para una fila de un tableView
    func element(atIndexPath indexPath: IndexPath)->Element{
        return _model[indexPath.row]
    }
    
    
    // Estas 3 funciones son las que debemos implementar para ser el dataSource de cualquier UITableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  _cellMaker(_model[indexPath.row], tableView)
        
        return cell
    }

    
    
}
