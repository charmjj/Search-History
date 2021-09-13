//
//  MarketDataTests.swift
//  MarketDataTests
//
//  Created by Charmaine Lim on 4/8/21.
//

import XCTest
@testable import MarketData

class MarketDataTests: XCTestCase {
    
    // test_operation_withCertainInputs_shouldDoSomething()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_JsonParser_CanParseJsonDataIntoStockInfoArray() throws {
        let stocks: [StockInfoModel] = JsonParser.load("StockInfoData.json")
        XCTAssertEqual(stocks.count, 20)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test_MockStockListDataService_getTopStocksSuccess() throws {
        let sut = MockStockListDataService()

        sut.getTopStocks { result in
            switch result{
            case .success(let stocks):
                XCTAssertEqual(stocks.count, 20)
            default:
                break
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
