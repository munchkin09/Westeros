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
    
    func house(named: String) -> House?
    
    func houses(filteredBy: (House) -> Bool) -> [House]
}


final class LocalFactory : HouseFactory {
    
    
    func house(named: String) -> House? {
        /*var house : House? = nil
        
        for tempHouse in houses {
            if tempHouse.name == named {
                house = tempHouse
                break
            }
        }
        return house*/
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
    }
    
    var seasons : [Season] {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            
            //Season 1
            let s01e01 = Episode(name: "Winter Is Coming", emisionDate: formatter.date(from: "17/04/2011")!)
            let s01e02 = Episode(name: "The kingsroad", emisionDate: formatter.date(from: "24/04/2011")!)
            let season1 = Season(name: "Season 1", publishDate: formatter.date(from: "17/04/2011")!, episodes: [s01e01,s01e02].sorted())
            s01e01.season = season1
            s01e02.season = season1
            
            //Season 2
            let s02e01 = Episode(name: "The North Remembers", emisionDate: formatter.date(from: "01/04/2012")!)
            let s02e02 = Episode(name: "The Night Lands", emisionDate: formatter.date(from: "08/04/2012")!)
            let season2 = Season(name: "Season 2", publishDate: formatter.date(from: "01/04/2012")!, episodes: [s02e01,s02e02].sorted())
            s02e01.season = season2
            s02e02.season = season2
            
            //Season 3
            let s03e01 = Episode(name: "Valar Dohaeris", emisionDate: formatter.date(from: "31/03/2013")!)
            let s03e02 = Episode(name: "Dark wings, dark words", emisionDate: formatter.date(from: "07/04/2013")!)
            let season3 = Season(name: "Season 3", publishDate: formatter.date(from: "31/03/2013")!, episodes: [s03e01,s03e02].sorted())
            
            //Season 4
            let s04e01 = Episode(name: "Two Swords", emisionDate: formatter.date(from: "06/04/2014")!)
            let s04e02 = Episode(name: "The lion and the rose", emisionDate: formatter.date(from: "07/04/2014")!)
            let season4 = Season(name: "Season 4", publishDate: formatter.date(from: "06/04/2014")!, episodes: [s04e01,s04e02].sorted())

            //Season 5
            let s05e01 = Episode(name: "The wars to coming", emisionDate: formatter.date(from: "12/04/2015")!)
            let s05e02 = Episode(name: "The house of black and white", emisionDate: formatter.date(from: "19/04/2015")!)
            let season5 = Season(name: "Season 5", publishDate: formatter.date(from: "12/04/2015")!, episodes: [s05e01,s05e02].sorted())
            
            //Season 6
            let s06e01 = Episode(name: "The red woman", emisionDate: formatter.date(from: "24/04/2016")!)
            let s06e02 = Episode(name: "Home", emisionDate: formatter.date(from: "01/05/2016")!)
            let season6 = Season(name: "Season 6", publishDate: formatter.date(from: "24/04/2016")!, episodes: [s06e01,s06e02].sorted())
            
            //Season 7
            let s07e01 = Episode(name: "Dragonstone", emisionDate: formatter.date(from: "16/07/2017")!)
            let s07e02 = Episode(name: "Stormbone", emisionDate: formatter.date(from: "23/07/2017")!)
            let season7 = Season(name: "Season 7", publishDate: formatter.date(from: "16/07/2017")!, episodes: [s07e01,s07e02].sorted())

            
            return [season6,season4,season7,season1,season5,season2,season3].sorted()
        }
    }

    var houses: [House] {
        get {
            
            let starkUrl = URL(string:"https://awoiaf.westeros.org/index.php/House_Stark")!
            
            let lannisterUrl = URL(string:"https://awoiaf.westeros.org/index.php/House_Lannister")!
            
            let targayrenUrl = URL(string:"https://awoiaf.westeros.org/index.php/House_Targaryen")!
            
            //Aquí creamos las casas una vez
            let sigilStark = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
            let stark = House(name: "Stark", sigil: sigilStark, words: "Winter is Coming", url: starkUrl)
            
            
            let sigilLannister = Sigil(description: "Rampant Lion", image: #imageLiteral(resourceName: "lannister.jpg"))
            let lannister = House(name: "Lannister", sigil: sigilLannister, words: "Hear me roar", url: lannisterUrl)
            
            let sigilTargaryen = Sigil(description: "Three dragons", image: #imageLiteral(resourceName: "Casa_Targaryen_estandarte.png"))
            let targaryen = House(name: "Targaryen", sigil: sigilTargaryen, words: "Fire and Blood", url: targayrenUrl)
            
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
    
    func houses(filteredBy: (House) -> Bool) -> [House] {
        let filtered = houses.filter(filteredBy)
        return filtered
    }
    
    func seasons(filteredBy: (Season) -> Bool) -> [Season] {
        let filtered = seasons.filter(filteredBy)
        return filtered
    }
}
