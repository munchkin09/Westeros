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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
        XCTAssertEqual(houses.count, 2)
    }
    
    func testLocaRepositorySearchByName() {
        var house = Repository.local.getHouseByName(name: "Stark")
        XCTAssertNotNil(house)
        house = Repository.local.getHouseByName(name: "Jander")
        XCTAssertNil(house)
        house = Repository.local.getHouseByName(name: "Lannister")
        XCTAssertNotNil(house)
        
    }
    
}
