//
//  LinkedListTests.swift
//  algphorithimSampleTests
//
//  Created by ha1f on 2020/09/25.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation
import XCTest

@testable import algphorithimSample

final class LinkedListTests: XCTestCase {
    func testAppend() {
        let list = LinkedList<Int>()
        XCTAssertEqual(list.asArray(), [])
        list.append(8)
        XCTAssertEqual(list.asArray(), [8])
        list.append(100)
        XCTAssertEqual(list.asArray(), [8, 100])
        list.append(200)
        XCTAssertEqual(list.asArray(), [8, 100, 200])
    }

    func testGetElement() {
        let list = LinkedList<Int>()
        list.append(8)
        list.append(100)
        list.append(200)
        XCTAssertNil(list.getElement(at: -1))
        XCTAssertEqual(list.getElement(at: 0), 8)
        XCTAssertEqual(list.getElement(at: 1), 100)
        XCTAssertEqual(list.getElement(at: 2), 200)
        XCTAssertNil(list.getElement(at: 3))
    }

    func testFirstLast() {
        let list = LinkedList<Int>()
        XCTAssertNil(list.first)
        list.append(8)
        XCTAssertEqual(list.first, 8)
        XCTAssertEqual(list.last, 8)
        list.append(100)
        XCTAssertEqual(list.first, 8)
        XCTAssertEqual(list.last, 100)
        list.append(200)
        XCTAssertEqual(list.first, 8)
        XCTAssertEqual(list.last, 200)
    }

    func testInsert() {
        let list = LinkedList<Int>()
        XCTAssertEqual(list.asArray(), [])

        list.append(8)
        XCTAssertEqual(list.asArray(), [8])

        list.insert(100, at: 0)
        XCTAssertEqual(list.asArray(), [100, 8])

        list.insert(50, at: 1)
        XCTAssertEqual(list.asArray(), [100, 50, 8])

        list.insert(30, at: 1)
        XCTAssertEqual(list.asArray(), [100, 30, 50, 8])
    }
}
