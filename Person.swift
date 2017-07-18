//
//  Character.swift
//  Westeros
//
//  Created by Carlos Ledesma on 6/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

final class Person {
    let name           : String
    private let _alias : String?
    let house          : House
    var alias : String {
        get {
            /* Forma coñazo de hacer una asignación de una variable Optional
            if let _alias = _alias {
                // Si el alias privado puede dar un valor a _alias del if, devolvemos ese alias
                return _alias
            } else {
                // Si no, devolvemos una cadena vacía
                return ""
            }*/
            
            return _alias ?? ""
        }
    }
    
    init(name: String, alias: String?, house: House) {
        (self.name, self._alias, self.house) = (name,alias,house)
    }
    
    convenience init(name: String, house: House) {
        self.init(name: name, alias: nil, house: house)
    }
    
}


extension Person {
    var fullName : String {
        get {
            return "\(name) \(house.name)"
        }
    }
}

extension Person {
    var proxy : String {
        return "\(name) \(alias) \(house.name)"
    }
}

extension Person : Hashable {
    var hashValue: Int {
        
        return proxy.hashValue
    }
}

extension Person : Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

// Implementar Comparable

extension Person : Comparable {
    static func <(lhs: Person, rhs: Person) -> Bool {
        if lhs.proxy < rhs.proxy {
            return true
        }
        return false
    }

    
}
