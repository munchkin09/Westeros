//
//  Episode.swift
//  Westeros
//
//  Created by Carlos Ledesma on 28/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

final class Episode {
 
    let name : String
    let emisionDate: Date
    private weak var _season : Season?
    
    init(name: String, emisionDate: Date) {
        
        self.name = name
        self.emisionDate = emisionDate
        _season = nil
        
    }
    
    var season: Season {
        get {
            return _season!
        }
        set(theSeason) {
            _season = theSeason
        }
    }
}

extension Episode {
    var proxy : String {
        return "\(name)"
    }
    
    var proxyComparable : String {
        return "\(emisionDate)"
    }
}

extension Episode : Hashable {
    var hashValue: Int {
        return proxy.hashValue
    }

    
}

extension Episode : Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        if lhs.proxy == rhs.proxy {
            return true
        }
        return false
    }
}


extension Episode : Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        if lhs.proxyComparable < rhs.proxyComparable {
            return true
        }
        return false
    }
}

extension Episode : CustomStringConvertible {
    var description: String {
        return proxy
    }

    
}
