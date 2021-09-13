//
//  StockDetailsView.swift
//  MarketData
//
//  Created by Charmaine Lim on 5/8/21.
//

import SwiftUI

struct StockDetailsView: View {
    
    public var stock: StockInfoModel
    
    @StateObject var vm = SearchHistoryViewModel(searchHistoryService: SearchHistoryDataService()) 
    
    var body: some View {
        HStack {
            RoundedRectangleImageView(urlString: stock.imageURL ?? "")
            Text(stock.name)
            Text(stock.symbol)
                .navigationTitle(stock.symbol)
        }.onAppear() {
            vm.addStocktoSearchHistory(stock: stock)
        }
    }
}

struct StockDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = StockListViewModel(stockListService: MockStockListDataService())
        if let stocks = vm.stocks {
            StockDetailsView(stock: stocks[0])
        } else {
            Text("No Stock")
        }
    }
}
