//
//  Stack.swift
//  algphorithimSample
//
//  Created by はるふ on 2020/09/19.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

struct Stack<Element> {
    private var _elements: [Element]

    var isEmpty: Bool {
        _elements.isEmpty
    }

    init(_ elements: [Element] = []) {
        _elements = elements
    }

    mutating func pop() -> Element? {
        _elements.popLast()
    }

    mutating func push(_ element: Element) {
        _elements.append(element)
    }

    func peek() -> Element? {
        _elements.last
    }
}
