//
//  SeasonTests.swift
//  Westeros
//
//  Created by Carlos Ledesma on 28/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    
    var seasons : [Season] = []
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
         seasons = Repository.local.seasons
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumberOfChapters() {
        
        XCTAssertNotEqual(seasons[0].episodes.count, 0)
    }
    
    func testSeasonComparable() {
        let season = seasons[0]
        
        //Identidad
        XCTAssertEqual(season,season)
        
        //Igualdad
        XCTAssertEqual(season, Repository.local.seasons[0])
        
        //Desigualdad
        XCTAssertNotEqual(season, Repository.local.seasons[1])
    }
    
    func testHashable() {
        
        XCTAssertNotNil(seasons[0].hashValue)
    }
    
    func testSeasonComparison() {
    
        XCTAssertLessThan(seasons[0], seasons[1])
    }
    
    func testCustomString() {
        let name_season = seasons[0].description
        XCTAssertEqual(name_season, "Season 1")
    }
   }
