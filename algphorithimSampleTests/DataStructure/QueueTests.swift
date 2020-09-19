//
//  QueueTests.swift
//  algphorithimSampleTests
//
//  Created by Yamaguchi Tomoki on 2020/09/20.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation
import XCTest
@testable import algphorithimSample

class QueueTests: XCTestCase {

    func testQueue() {
        var queue = Queue<Int>()
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

    func testTwoStackQueue() {
        let queue = TwoStackQueue<Int>()
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
}
