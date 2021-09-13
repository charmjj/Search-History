//
//  SearchHistoryDataService.swift
//  MarketData
//
//  Created by Charmaine Lim on 18/8/21.
//

import Foundation
import Collections
import SwiftUI

class SearchHistoryDataService: SearchHistoryService {
    
    // get search history that is stored in UserDefaults
    func getSearchHistory() -> Deque<StockInfoModel> {
        var searchHistory: Deque<StockInfoModel> = []
        if let data = UserDefaults.standard.object(forKey: "searchHistory") as? Data {
            searchHistory = try! PropertyListDecoder().decode(Deque<StockInfoModel>.self, from: data)
        }
        return searchHistory
    }
    
    // update search history with the new Deque
    func updateSearchHistory(searchHistory: Deque<StockInfoModel>) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(searchHistory), forKey: "searchHistory")
    }
    
}

@propertyWrapper struct AppStorage {
    private var history: Data? = UserDefaults.standard.object(forKey: "searchHistory") as? Data
    public var wrappedValue: Deque<StockInfoModel> {
        mutating get {
            if (history != nil) {
                // check history according to list of available stocks.
                    // if stock not in list, remove stock from history.
                return try! PropertyListDecoder().decode(Deque<StockInfoModel>.self, from: history!)
            } else {
                return []
            }
            
        }
        nonmutating set {
            // newValue: Deque<StockInfoModel>
            UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: "searchHistory")
            
        }
    }
    
}

func saveInstrumentAccessedFromSearch(symbol: String) {
    return
}

func getInstrumentsAccessedFromSearch() -> [StockInfoModel] {
    return []
}

func getSearchableInstrumentsList() -> [StockInfoModel] {
    return []
}




