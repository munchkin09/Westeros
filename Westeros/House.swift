//
//  House.swift
//  Westeros
//
//  Created by Carlos Ledesma on 6/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//
import UIKit

// MARK: - Classes
typealias Words = String
typealias Members = Set<Person>

// MARK: - House
final class House {
    
    let name  : String
    let sigil : Sigil
    let words : Words
    let wikiURL : URL
    private var _members : Members
    
    
    init(name  : String,
         sigil : Sigil,
         words : Words,
         url : URL) {
        
        (self.name,self.sigil,self.words,self.wikiURL) = (name, sigil, words,url)
        _members = Members()
        
    }
}



// MARK: - Sigil
final class Sigil {
    
    let description : String
    let image       : UIImage
    
    
    init(description : String,
                image : UIImage) {
        
        (self.description, self.image) = (description, image)
    }
    
}

extension House {
    
    var count : Int {
        return _members.count
    }
    
    func add(person : Person) {
        guard person.house.name == self.name else {
            return
        }
        _members.insert(person)
    }
    
    var members : Members {
        return _members
    }
}

extension House {
    var proxyForEquality : String {
        return "\(name) \(words) \(count)"
    }
    
    var proxyForComparison : String {
        return "\(name) \(count)".uppercased()
    }
}

extension House : Hashable {
    var hashValue: Int {
        
        return proxyForEquality.hashValue
    }
}

extension House : Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        
        return lhs.proxyForEquality == rhs.proxyForEquality
        
        
    }
}

extension House : Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    

    
}
