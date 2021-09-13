//
//  StockSearchView.swift
//  MarketData
//
//  Created by Charmaine Lim on 19/8/21.
//

import SwiftUI

struct StockSearchView: View {
    
    @StateObject var vm = StockSearchViewModel(stockSearchService: StockSearchDataService())
    
    @Binding var searchedText: String
    
    var body: some View {
        
        if let stocks300 = vm.stocks300 {
            let matchingStocks = stocks300.filter {$0.name.hasPrefix(searchedText) || $0.symbol.hasPrefix(searchedText)}
            if matchingStocks.count > 0 {
                List(matchingStocks) { stock in
                    NavigationLink(destination: StockDetailsView(stock: stock)) {
                        StockSearchRowView(stockSearchStock: stock)
                    }
                }
            } else {
                Text("No stocks found")
            }
        } else {
            ProgressView()
        }
    }
        
}

struct StockSearchView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        StockSearchView(searchedText: .constant(""))
    }
}
