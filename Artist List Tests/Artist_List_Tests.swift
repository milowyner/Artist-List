//
//  Artist_List_Tests.swift
//  Artist List Tests
//
//  Created by Milo Wyner on 7/9/20.
//  Copyright © 2020 Milo Wyner. All rights reserved.
//

import XCTest
@testable import Artist_List

class Artist_List_Tests: XCTestCase {

    func testLoadJSON_firstArtistLoaded_hasNameVincent() {
        let expectedName = "Vincent Van Gogh"
        let sut: [Artist] = loadFromJSON("artistData.json")
        
        let firstArtistName = sut[0].name
        
        XCTAssertEqual(firstArtistName, expectedName)
    }

}
