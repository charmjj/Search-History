//
//  LimitedDeque.swift
//  MarketData
//
//  Created by Charmaine Lim on 18/8/21.
//

import Foundation
import Collections

public struct LimitedDeque<Element: Equatable> {
    
    var items: Deque<Element> = []

    let capacity: Int // set to public??
    
    public init(capacity: Int, items: Deque<Element>) {
        self.capacity = capacity
        self.items = items
    }
    
    
    // if item already exists in deque, bring item to end of deque.
    // else,
        // if deque has alr hit max capacity, remove the first element of the deque.
        // append the new item to the deque.
    
    public mutating func appendItem(_ item: Element) {
        if let index = items.firstIndex(of: item) { 
            items.remove(at: index)
            items.append(item)
        } else {
            if items.count >= capacity {
                items.popFirst()
            }
            items.append(item)
        }
    }
}


