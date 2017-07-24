//
//  Delegates.swift
//  Westeros
//
//  Created by Carlos Ledesma on 18/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

final class Delegates {
    
    static func housesDelegate(model: [House]) -> ArrayTableViewDelegate<House> {
        let arr = ArrayTableViewDelegate<House>(model: model)
        return arr
    }
    
    
}
