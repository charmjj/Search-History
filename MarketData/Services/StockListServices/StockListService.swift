//
//  StockListService.swift
//  MarketData
//
//  Created by Charmaine Lim on 5/8/21.
//

import Foundation

protocol StockListService {
    func getTopStocks(completion: @escaping (Result<[StockInfoModel], StockListServiceError>) -> Void)
}
