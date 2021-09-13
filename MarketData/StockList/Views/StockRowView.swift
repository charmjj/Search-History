//
//  StockRow.swift
//  MarketData
//
//  Created by Charmaine Lim on 4/8/21.
//

import SwiftUI

struct StockRowView: View {
    
    public var stock: StockInfoModel
    
    var body: some View {
        HStack {
                    RoundedRectangleImageView(urlString: stock.imageURL ?? "")
                    VStack(alignment: .leading) {
                        Text(stock.name)
                            .font(.headline)
                        Text(stock.symbol)
                            .font(.subheadline)
                    }
                    .padding(.leading, 5)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(((stock.priceInfo.tradePrice.getValue()) as String))
                            .font(.headline)
                        Text(stock.priceInfo.profitAndLossString())
                            .font(.caption)
                            .foregroundColor(stock.priceInfo.actualChange.value >= 0.00 ? Color.green : Color.red)
                    }
                }
                .padding()
    }
}

struct StockRow_Previews: PreviewProvider {
    
    static var previews: some View {
        let vm = StockListViewModel(stockListService: MockStockListDataService())
        Group {
            if let stocks = vm.stocks {
            StockRowView(stock: stocks[0])
            } else {
                Text("No Stock")
            }
        }
        .previewLayout(.fixed(width: 450, height: 100))
    }
}
