//
//  ThreadSafeQueue.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/09/23.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

/// isolation = .serializable
struct ThreadSafeQueue<Q: QueueProtocol>: QueueProtocol {
    typealias Element = Q.Element

    private var _internalQueue: Q
    private let _lock = NSLock()

    init(_ queue: Q) {
        _internalQueue = queue
    }

    var isEmpty: Bool {
        _lock.lock()
        defer {
            _lock.unlock()
        }
        return _internalQueue.isEmpty
    }

    mutating func add(_ element: Element) {
        _lock.lock()
        defer {
            _lock.unlock()
        }
        _internalQueue.add(element)
    }

    mutating func remove() -> Element? {
        _lock.lock()
        defer {
            _lock.unlock()
        }
        return _internalQueue.remove()
    }

    func peek() -> Element? {
        _lock.lock()
        defer {
            _lock.unlock()
        }
        return _internalQueue.peek()
    }
}

