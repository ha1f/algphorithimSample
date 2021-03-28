//
//  QueueTests.swift
//  algphorithimSampleTests
//
//  Created by ha1f on 2020/09/20.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation
import XCTest
@testable import algphorithimSample

class QueueTests: XCTestCase {
    private func _testIntQueue<Q: QueueProtocol>(
        queueBuilder: @autoclosure () -> Q
    ) where Q.Element == Int {
        var queue = queueBuilder()
        queue.add(0)
        queue.add(1)
        queue.add(2)
        queue.add(3)
        XCTAssertEqual(queue.remove(), 0)
        XCTAssertEqual(queue.remove(), 1)
        queue.add(4)
        XCTAssertEqual(queue.remove(), 2)
        XCTAssertEqual(queue.remove(), 3)
        XCTAssertEqual(queue.remove(), 4)
        XCTAssertNil(queue.remove())
        XCTAssertNil(queue.remove())
    }

    func testQueue() {
        _testIntQueue(queueBuilder: Queue<Int>())
    }

    func testTwoStackQueue() {
        _testIntQueue(queueBuilder: TwoStackQueue<Int>())
    }

    func testCyclicQueue() {
        _testIntQueue(queueBuilder: CyclicQueue<Int>())
    }

    func testThreadSafeQueue() {
        _testIntQueue(queueBuilder: ThreadSafeQueue(Queue<Int>()))
        _testIntQueue(queueBuilder: ThreadSafeQueue(TwoStackQueue<Int>()))
        _testIntQueue(queueBuilder: ThreadSafeQueue(CyclicQueue<Int>()))
    }
}
