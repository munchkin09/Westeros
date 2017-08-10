//
//  Season.swift
//  Westeros
//
//  Created by Carlos Ledesma on 28/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

final class Season {
    
    let name : String
    let publishDate : Date
    let episodes : [Episode]
    
    
    init(name: String, publishDate: Date, episodes: [Episode]) {
        
        self.name = name
        self.publishDate = publishDate
        self.episodes = episodes
    }
    
    
}

extension Season {
    
    var proxy : String {
        return "\(publishDate)"
    }
    
}


extension Season : Hashable, Equatable {
    var hashValue: Int {
        return proxy.hashValue
    }
    
    static func ==(lhs: Season, rhs: Season) -> Bool {
        if lhs.proxy == rhs.proxy {
            return true
        }
        return false
    }
}

extension Season : CustomStringConvertible {
    var description: String {
        return "\(name)"
    }
}

extension Season : Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        if lhs.proxy < rhs.proxy {
            return true
        }
        return false
    }

    
}

