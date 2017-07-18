//
//  RepositoryTests.swift
//  Westeros
//
//  Created by Carlos Ledesma on 11/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    
    var houses : [House]!
    var stark : House!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        houses = Repository.local.houses
        stark = Repository.local.house(named: "Stark")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHouseCreation() {
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 3)
    }
    
    func testLocaRepositorySearchByName() {
        var house = Repository.local.house(named: "Stark")
        XCTAssertNotNil(house)
        house = Repository.local.house(named: "Jander")
        XCTAssertNil(house)
        house = Repository.local.house(named: "Lannister")
        XCTAssertNotNil(house)
        house = Repository.local.house(named: "LaNnistEr")
        XCTAssertEqual(house?.name, "Lannister")
        
    }
    
    func testLocalRepositorySortedHouses() {
         XCTAssertEqual(houses, houses.sorted())
    }
    
    func testLocalFilteredBy() {
        /*let results : [House] = Repository.local.houses(filteredBy: (stark) {
            
        })*/
        
        var filtered = Repository.local.houses.filter{ $0.count == 4}
        XCTAssertEqual(filtered.count, 1)
        
        filtered = Repository.local.houses(filteredBy: {$0.count == 4})
        XCTAssertEqual(filtered.count, 1)
    }
    
}
