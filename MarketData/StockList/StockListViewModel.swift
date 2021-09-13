//
//  StockListViewModel.swift
//  MarketData
//
//  Created by Charmaine Lim on 5/8/21.
//

import Foundation

class StockListViewModel: ObservableObject {
    
    
    private var stockListService: StockListService
    
    @Published var stocks: [StockInfoModel]?

    init(stockListService: StockListService) {
        self.stockListService = stockListService
        initStocks()
    }
    
    private func initStocks() {
        stockListService.getTopStocks { result in
            switch result {
                case .success(let stocks):
                    DispatchQueue.main.async { // Update the published properties on the MAIN THREAD. UI can only be updated using main thread. initStocks() was run on background thread.
                            self.stocks = stocks
                     }
                default:
                    break
            }
        }
    }
    
}
