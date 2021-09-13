//
//  SearchHistoryService.swift
//  MarketData
//
//  Created by Charmaine Lim on 18/8/21.
//

import Foundation
import Collections

protocol SearchHistoryService {
    
    func getSearchHistory() -> Deque<StockInfoModel>
    
    func updateSearchHistory(searchHistory: Deque<StockInfoModel>)
    
}
