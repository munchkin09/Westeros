//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by Carlos Ledesma on 18/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit


class ArrayTableViewDelegate<Element>: NSObject {
    var source : ArrayDataSource<Element>?
    weak var viewController : UIViewController?
}

