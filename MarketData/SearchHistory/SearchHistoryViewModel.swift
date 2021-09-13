//
//  SearchHistoryViewModel.swift
//  MarketData
//
//  Created by Charmaine Lim on 18/8/21.
//

import Foundation
import Collections

class SearchHistoryViewModel: ObservableObject {
    
    private var searchHistoryService: SearchHistoryService
    
    private var searchHistoryModel: LimitedDeque<StockInfoModel>
    
    @Published var searchHistory: Deque<StockInfoModel>? // from searchHistoryModel
    
    init(searchHistoryService: SearchHistoryService) {
        self.searchHistoryService = searchHistoryService
        self.searchHistoryModel = LimitedDeque<StockInfoModel>(capacity: 10, items: searchHistoryService.getSearchHistory())
        self.searchHistory = searchHistoryModel.items
    }
    
    public func addStocktoSearchHistory(stock: StockInfoModel) {
        // add new stock
        searchHistoryModel.appendItem(stock)
        
        // print(searchHistoryModel.items)
        // update published variable
        self.searchHistory = searchHistoryModel.items
        // update UserDefaults
        searchHistoryService.updateSearchHistory(searchHistory: self.searchHistory!)
    }
    
}


