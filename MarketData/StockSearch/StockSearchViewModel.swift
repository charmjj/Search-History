//
//  StockSearchViewModel.swift
//  MarketData
//
//  Created by Charmaine Lim on 19/8/21.
//

import Foundation
import Collections

class StockSearchViewModel: ObservableObject {
    
    private var stockSearchService: StockSearchService
    
    @Published var stocks300: [StockInfoModel]?
    
    init(stockSearchService: StockSearchService) {
        self.stockSearchService = stockSearchService
        initStocks300()
    }
    
    // initialise all 300 stocks to be used for search function later on
    private func initStocks300() {
        stockSearchService.getStocks300 { result in
            switch result {
                case .success(let stocks300):
                    DispatchQueue.main.async {
                        self.stocks300 = stocks300
                     }
                default:
                    break
            }
        }
    }
    
    // populate published variable matchingStocks
    public func searchForMatchingStocks(stock: String) -> [StockInfoModel]? {
        // call service function
        let matchingStocks = stockSearchService.searchForMatchingStocks(stock: stock, stockArray: stocks300 ?? []) 
        return matchingStocks
    }
    
}
