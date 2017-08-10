//
//  EpisodeTest.swift
//  Westeros
//
//  Created by Carlos Ledesma on 9/8/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTest: XCTestCase {
    
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
    
    func testEpisodeComparable() {
        let episode = seasons[0].episodes[0]
        
        //Identidad
        XCTAssertEqual(episode,episode)
        
        //Igualdad
        XCTAssertEqual(episode, Repository.local.seasons[0].episodes[0])
        
        //Desigualdad
        XCTAssertNotEqual(episode, Repository.local.seasons[1].episodes[0])
    }
    
    func testHashable() {
        
        XCTAssertNotNil(seasons[0].episodes[0].hashValue)
    }
    
    func testSeasonComparison() {
        
        XCTAssertLessThan(seasons[0].episodes[0], seasons[0].episodes[1])
    }
    
    func testCustomString() {
        let name_season = seasons[0].episodes[0].description
        XCTAssertEqual(name_season, "Winter Is Coming")
    }

}
