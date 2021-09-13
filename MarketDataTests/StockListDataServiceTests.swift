//
//  StockListDataServiceTests.swift
//  MarketDataTests
//
//  Created by Charmaine Lim on 6/8/21.
//


import XCTest
@testable import MarketData

class StockListDataServiceTests: XCTestCase {
    
//    test_operation_withCertainInputs_shouldDoSomething()
//    test_getPeople_inNormalCases_shouldGetPeople()
    
    var sut: StockListDataService!
    
    override func setUpWithError() throws {
            try super.setUpWithError()
            sut = StockListDataService()
        }
        
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_getTopStocks_getsTopStocks() throws {
        //setUpWithError()
        // run your test
        // tearDownWithError()
        let expectation = self.expectation(description: "API Call Completed")
        
        var topStocks: [StockInfoModel]? = nil // No top stocks
        
        sut.getTopStocks { result in
            switch result {
            case .success(let stocks):
                topStocks = stocks
                
            case .failure:
                break
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil) // wait for max 5 secs
        XCTAssertTrue(topStocks != nil) // Check if have top stocks
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
