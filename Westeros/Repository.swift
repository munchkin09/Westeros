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
                break
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
            
            let sigilTargaryen = Sigil(description: "Three dragons", image: #imageLiteral(resourceName: "Casa_Targaryen_estandarte.png"))
            let targaryen = House(name: <#T##String#>, sigil: sigilTargaryen, words: "Fire and Blood")
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let jaime = Person(name: "Jaime", alias: "Slayerking", house: lannister)
            let tywin = Person(name: "Tywin", alias: "Lannister lion", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            let daeneris = Person(name: "Daeneris", alias: "Khaleesi", house: targaryen)
            let viserys = Person(name: "Viserys", alias: "Rey mendigo", house: targaryen)
            
            stark.add(person: robb)
            stark.add(person: arya)
            
            lannister.add(person: tyrion)
            lannister.add(person: cersei)
            lannister.add(person: jaime)
            lannister.add(person: tywin)
            
            targaryen.add(person: daeneris)
            targaryen.add(person: viserys)
            
            return [stark, lannister, targaryen].sorted()
        }
    }

    
}
