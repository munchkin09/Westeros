//
//  HouseTests.swift
//  Westeros
//
//  Created by Carlos Ledesma on 6/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
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
        stark = Repository.local.house(named: "Stark")
        lannister = Repository.local.house(named: "Lannister")
        
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
    
    func testHouseExistence() {
       
        XCTAssertNotNil(stark)
        
    }
    
    func testSigilExistence() {
        XCTAssertNotNil(starkSigil)
        
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPersons() {
        XCTAssertEqual(stark.count, 2)
        stark.add(person: robb)
        
        XCTAssertEqual(stark.count, 2)
        stark.add(person: arya)
        
        XCTAssertEqual(stark.count, 2)
        
        stark.add(person: tyrion)
        XCTAssertEqual(stark.count, 2)
    }
    
    func testHouseEquality() {
        
        //Identidad
        XCTAssertEqual(stark, stark)
        
        //Igualdad
        let stark2 = House(name: "Stark", sigil: starkSigil, words: "Winter is Coming", url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        stark2.add(person: robb)
        stark2.add(person: arya)
        XCTAssertEqual(stark, stark2)
        
        //Desigualdad
        XCTAssertNotEqual(stark, lannister)
        
    }
    
    func testHashable() {
        XCTAssertNotNil(stark.hashValue)
    }
    
    func testHouseComparison() {
        XCTAssertLessThan(lannister, stark)
    }
    
    
    
}






























