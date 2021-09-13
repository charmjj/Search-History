//
//  StockListDataService.swift
//  MarketData
//
//  Created by Charmaine Lim on 6/8/21.
//

import Foundation

class StockListDataService: StockListService {
    
    let url = URL(string: "http://localhost:8000/StockInfoData.json")!
    
    // use @escaping when the closure needs to outlive the life of its function. e.g when fn makes a network call
    func getTopStocks(completion: @escaping (Result<[StockInfoModel], StockListServiceError>) -> Void) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            // Show Response
            print(">>>>> Response Object: ",String(describing: response))
            
            // Ensure no errors
            guard error == nil else {
                print(">>>>> Error Object: ", String(describing: error))
                completion(.failure(StockListServiceError(message: error?.localizedDescription ?? "\(#function) Error")))
                return
            }
            
            // Ensure data is present
            guard let data = data else {
                completion(.failure(StockListServiceError(message: "No Data")))
                return
            }

            // Serialize the data into an object
            do {
                let decoder = JSONDecoder()
                let stocks: [StockInfoModel] = try decoder.decode([StockInfoModel].self, from: data)
                print(">>>>> Stocks Array: ", String(describing: stocks))
                completion(.success(stocks))
            } catch {
                print(">>>>> Serialization Error: ", String(describing: error))
                completion(.failure(StockListServiceError(message: "Serialization Error")))
            }
        })
        task.resume()
    }
    
    
}
