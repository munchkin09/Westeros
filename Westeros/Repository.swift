//
//  Repository.swift
//  Westeros
//
//  Created by Carlos Ledesma on 11/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import Foundation

final class Repository {
    
    static let local = LocalFactory()
    
}

protocol HouseFactory {
    var houses : [House] { get }
    
    func getHouseByName(name: String) -> House?
}


final class LocalFactory : HouseFactory {
    
    func getHouseByName(name: String) -> House? {
        var house : House? = nil
        for tempHouse in houses {
            if tempHouse.name == name {
                house = tempHouse
            }
        }
        
        return house
    }

    var houses: [House] {
        get {
            //Aquí creamos las casas una vez
            let sigilStark = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
            let stark = House(name: "Stark", sigil: sigilStark, words: "Winter is Coming")
            
            let sigilLannister = Sigil(description: "Rampant Lion", image: #imageLiteral(resourceName: "lannister.jpg"))
            let lannister = House(name: "Lannister", sigil: sigilLannister, words: "Hear me roar")
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            
            stark.add(person: robb)
            stark.add(person: arya)
            
            lannister.add(person: tyrion)
            lannister.add(person: cersei)
            
            return [stark, lannister].sorted()
        }
    }

    
}
