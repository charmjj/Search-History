//
//  StockList.swift
//  MarketData
//
//  Created by Charmaine Lim on 4/8/21.
//

import SwiftUI

struct StockListView: View {
    
    @StateObject var vm = StockListViewModel(stockListService: MockStockListDataService())
    
    var body: some View { // TODO:
        
        VStack (alignment: .leading, spacing: 10) {
            
            if let stocks = vm.stocks {
                List(stocks) { stock in
                    NavigationLink(destination: StockDetailsView(stock: stock)) {
                        StockRowView(stock: stock)
                    }
                }
            } else {
                ProgressView()
            }
            
        }
    }
}

struct StockList_Previews: PreviewProvider {
    static var previews: some View {
        StockListView()
    }

}
