//
//  HouseViewController.swift
//  Westeros
//
//  Created by Carlos Ledesma on 10/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {
    
    @IBOutlet weak var houseNameView: UILabel!
   
    @IBOutlet weak var wordsView: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    
    
    let model : House
    
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = model.name
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel() {
        // model -> view
        
        houseNameView.text = "House \(model.name)"
        
        wordsView.text = "\(model.words)"
        
        sigilImageView.image = model.sigil.image
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncViewWithModel()
    }
    
}
