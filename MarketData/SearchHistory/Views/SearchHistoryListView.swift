//
//  SearchHistoryList.swift
//  MarketData
//
//  Created by Charmaine Lim on 19/8/21.
//

import SwiftUI

struct SearchHistoryListView: View {
    
   // let dummyStock =
    
    @StateObject var vm = SearchHistoryViewModel(searchHistoryService: SearchHistoryDataService())
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            
            Text("LAST VIEWED").font(.headline)
            
            if let searchHistory = vm.searchHistory {
                if searchHistory.count > 0 {
                    List(searchHistory) { stock in
                        
                        NavigationLink(destination: StockDetailsView(stock: stock)) {
                            
                            SearchHistoryRowView(searchHistoryStock: stock)
                            
                        }.rotationEffect(.radians(.pi))
                        .scaleEffect(x: -1, y: 1, anchor: .center)
                    }.rotationEffect(.radians(.pi))
                     .scaleEffect(x: -1, y: 1, anchor: .center)
                } else {
                    Text("No Search History")
                }
            } else {
                ProgressView()
            }
        }
    }
}

struct SearchHistoryList_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistoryListView()
    }
}
