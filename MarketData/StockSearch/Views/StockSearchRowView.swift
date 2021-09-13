//
//  StockSearchRowView.swift
//  MarketData
//
//  Created by Charmaine Lim on 19/8/21.
//

import SwiftUI

struct StockSearchRowView: View {
    
    public var stockSearchStock: StockInfoModel
    
    var body: some View {
        HStack {
            Text(stockSearchStock.name)
                .font(.headline)
            Text(stockSearchStock.symbol)
        }
    }
}

