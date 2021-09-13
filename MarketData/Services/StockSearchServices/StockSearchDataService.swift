//
//  StockSearchDataService.swift
//  MarketData
//
//  Created by Charmaine Lim on 19/8/21.
//

import Foundation

class StockSearchDataService: StockSearchService {
    
    func getStocks300(completion: @escaping (Result<[StockInfoModel], StockSearchServiceError>) -> Void) {
        mockDelay {
            let stocks300: [StockInfoModel] = JsonParser.load("StockInfoDataList.json")
            completion(.success(stocks300))
        }
    }
    
    func searchForMatchingStocks(stock: String, stockArray: [StockInfoModel]) -> [StockInfoModel] {
        
        let matchingStocks = stockArray.filter {$0.name.hasPrefix(stock) || $0.symbol.hasPrefix(stock)}
        return matchingStocks
        
    }

}
