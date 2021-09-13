//
//  MockDelay.swift
//  MarketData
//
//  Created by Charmaine Lim on 5/8/21.
//

import Foundation

public func mockDelay(completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: completion)
}
