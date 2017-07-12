//
//  CharacterTest.swift
//  Westeros
//
//  Created by Carlos Ledesma on 6/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
    
    var starkImage     : UIImage!
    var lannisterImage : UIImage!
    var starkSigil     : Sigil!
    var lannisterSigil : Sigil!
    
    var stark     : House!
    var lannister : House!
    
    var robb   : Person!
    var arya   : Person!
    var tyrion : Person!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        stark = Repository.local.getHouseByName(name: "Stark")
        lannister = Repository.local.getHouseByName(name: "Lannister")
        
        starkImage = stark.sigil.image
        lannisterImage = lannister.sigil.image
        starkSigil = stark.sigil
        lannisterSigil = stark.sigil
        
        
        robb = Person(name: "Robb", alias: "The young wolf", house: stark)
        arya = Person(name: "Arya", house: stark)
        tyrion = Person(name: "Tyrion", alias: "The imp", house: lannister)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence() {

        
        XCTAssertNotNil(tyrion)
        
    }
    
    func testFullName() {
        XCTAssertEqual(tyrion.fullName, "Tyrion Lannister")
    }
    
    func testPersonEquality() {
        // Identidad
        XCTAssertEqual(tyrion, tyrion)
        // Igualadad
        let imp = Person(name: "Tyrion", alias: "The imp", house: lannister)
        
        XCTAssertEqual(imp, tyrion)
        
        // Desigualdad
        XCTAssertNotEqual(tyrion, arya)
    }
}
