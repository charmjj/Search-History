//
//  SearchHistoryRow.swift
//  MarketData
//
//  Created by Charmaine Lim on 19/8/21.
//

import SwiftUI
import Collections

struct SearchHistoryRowView: View {
    
    public var searchHistoryStock: StockInfoModel
    
    var body: some View {
        HStack {
            Text(searchHistoryStock.name)
                .font(.headline)
            Text(searchHistoryStock.symbol)
        }
    }
}

struct SearchHistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let vm = SearchHistoryViewModel(searchHistoryService: SearchHistoryDataService())
        Group {
            if let searchHistory = vm.searchHistory {
                if searchHistory.count > 0 {
                    SearchHistoryRowView(searchHistoryStock: searchHistory[0])
                } else {
                    Text("No history")
                }
            } else {
                HStack {
                    Text("Name Here").font(.headline)
                    Text("Symbol Here")
                }
            }
        }
    }
}
