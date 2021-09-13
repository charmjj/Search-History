//
//  ContentView.swift
//  MarketData
//
//  Created by Charmaine Lim on 4/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchedText: String = ""
    
    @State var showStockListView: Bool = true
    
    @State var showSearchHistoryView: Bool = false
    
    @State var showStockSearchView: Bool = false
    
    var body: some View {
        NavigationView {
            
            VStack {
            
                HStack(alignment: .top) {
                    // search field
                    TextField("Company name / Stock symbol", text: $searchedText)
                        .padding(7)
                        .padding(.horizontal, 5)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .disableAutocorrection(true)
                        .keyboardType(.webSearch)
                        .accentColor(showStockListView ? .clear : .blue) // to toggle focus/cursor
                        .onChange(of: searchedText) { value in
                            let trimmedSearchText = searchedText.trimmingCharacters(in: .whitespaces)
                            if trimmedSearchText != "" { // search stock
                                showStockSearchView = true
                                showSearchHistoryView = false
                            } else { // show search history
                                showSearchHistoryView = true
                                showStockSearchView = false
                            }
                            
                        }
                        .onTapGesture {
                            showStockListView = false
                            if !showSearchHistoryView && searchedText.trimmingCharacters(in: .whitespaces) == "" {
                                showSearchHistoryView = true
                            }
                            // else if: when textfield tapped in the middle of typing sth
                        }
                        
                    
                    Spacer()
                    
                    if !showStockListView {
                        Button("Cancel"){
                            showStockListView.toggle() //
                            searchedText = ""
                        }
                    }

                }.padding(8) // end of HStack
                
                if showStockListView {
                    // show top 20 stocks and more
                    StockListView()
                        .navigationTitle("Top Stocks")
                    
                } else {
                    if showSearchHistoryView {
                        SearchHistoryListView()
                    } else if showStockSearchView {
                        StockSearchView(searchedText: $searchedText)
                    }
                    
                }
  
            } // end of VStack
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView().environmentObject(StockListViewModel(stockListService: MockStockListDataService()))
    }
}
