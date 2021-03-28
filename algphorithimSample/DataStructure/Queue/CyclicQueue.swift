//
//  CyclicQueue.swift
//  algphorithimSample
//
//  Created by ha1f on 2021/03/28.
//  Copyright © 2021 はるふ. All rights reserved.
//

import Foundation

/// removeFirstによるメモリコピーのコストを抑えたQueue
final class CyclicQueue<Element>: QueueProtocol {
    private var _elements: [Element]
    private var _startPoint: Int
    private var _length: Int
    private var _capacity: Int

    var isEmpty: Bool {
        _length == 0
    }

    init() {
        _elements = []
        _capacity = _elements.capacity
        _length = 0
        _startPoint = 0
    }

    private func _resize() {
        let length = _length
        let capacity = _capacity
        let startPoint = _startPoint

        var newElements: [Element] = []
        newElements.reserveCapacity(capacity + 1)
        for i in 0..<length {
            newElements.append(_elements[(startPoint + i) % capacity])
        }
        _elements = newElements
        _startPoint = 0
        _capacity = newElements.capacity
        // lengthは不変
    }

    func add(_ element: Element) {
        if _length + 1 > _capacity {
            _resize()
            // リサイズ直後は必ず末尾に追加できる
            _elements.append(element)
        } else {
            let index = _startPoint + _length
            let capacity = _capacity
            if index < capacity {
                // 確保しててもout of boundsにsubscriptでアクセスすると怒られるので
                _elements.append(element)
                assert(_elements.capacity == capacity) // 変わってないことを一応確認
            } else {
                _elements[index % capacity] = element
            }
        }

        _length += 1
    }

    func remove() -> Element? {
        guard _length > 0 else {
            return nil
        }
        _length -= 1
        let startPoint = _startPoint
        let element = _elements[startPoint]
        _startPoint = (startPoint + 1) % _capacity

        return element
    }

    func peek() -> Element? {
        _elements[_startPoint]
    }
}
