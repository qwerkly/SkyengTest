//
//  SkyengTestTests.swift
//  SkyengTestTests
//
//  Created by Бабич Иван Юрьевич on 15.03.2020.
//  Copyright © 2020 Babich Ivan. All rights reserved.
//

@testable import SkyengTest
import XCTest

class SkyengTestTests: XCTestCase {
    override func setUp() {
        
    }

    func testAllSpacesInSearch() {
        let search = "  "
        let wordsService = WordsServiceImpl(pageSize: 20)
        let searchExpectation = expectation(description: #function)
        
        wordsService.searchWords(search, currentPage: 1) { words, _ in
            XCTAssert((words ?? []).isEmpty)
            searchExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
