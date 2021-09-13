//
//  StockSearchService.swift
//  MarketData
//
//  Created by Charmaine Lim on 19/8/21.
//

import Foundation
import Collections

protocol StockSearchService {
    
    func getStocks300(completion: @escaping (Result<[StockInfoModel], StockSearchServiceError>) -> Void)
    
    func searchForMatchingStocks(stock: String, stockArray: [StockInfoModel]) -> [StockInfoModel]
    
}
