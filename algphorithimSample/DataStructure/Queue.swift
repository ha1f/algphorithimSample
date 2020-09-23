//
//  Queue.swift
//  algphorithimSample
//
//  Created by はるふ on 2020/09/19.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

struct Queue<Element>: QueueProtocol {
    private var _elements: [Element]

    var isEmpty: Bool {
        _elements.isEmpty
    }

    init(_ elements: [Element] = []) {
        _elements = elements
    }

    func peek() -> Element? {
        _elements.first
    }

    mutating func add(_ element: Element) {
        _elements.append(element)
    }

    mutating func remove() -> Element? {
        guard !_elements.isEmpty else {
            return nil
        }
        return _elements.removeFirst()
    }
}
