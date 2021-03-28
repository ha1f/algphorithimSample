//
//  BinarySearchTreeTests.swift
//  algphorithimSampleTests
//
//  Created by Yamaguchi Tomoki on 2021/03/28.
//  Copyright © 2021 はるふ. All rights reserved.
//

import Foundation
import XCTest

@testable import algphorithimSample

final class BinarySearchTreeTests: XCTestCase {
    func testInsertAndContains() {
        let tree = BinarySearchTree<Int>()
        XCTAssertFalse(tree.contains(0))
        XCTAssertFalse(tree.contains(3))

        tree.insert(0)
        XCTAssertTrue(tree.contains(0))
        XCTAssertFalse(tree.contains(3))

        tree.insert(3)
        XCTAssertTrue(tree.contains(0))
        XCTAssertTrue(tree.contains(3))
    }

    func testFind() {
        let tree = BinarySearchTree<Int>()
        for i in (0..<30).shuffled() {
            tree.insert(i)
        }
        XCTAssertEqual(tree.find(element: 0)?.element, 0)
        XCTAssertEqual(tree.find(element: 3)?.element, 3)
        XCTAssertEqual(tree.find(element: 19)?.element, 19)
        XCTAssertEqual(tree.find(element: 29)?.element, 29)
    }

    func testInsertUnique() {
        let elements = (0..<30).shuffled()
        let tree = BinarySearchTree<Int>()
        for i in elements {
            XCTAssertTrue(tree.insert(i))
            XCTAssertFalse(tree.insert(i))
        }
    }

    func testIterate() {
        let elements = (0..<30).shuffled()
        let tree = BinarySearchTree<Int>()
        for i in elements {
            tree.insert(i)
        }

        XCTAssertEqual(Set(elements), Set(tree.iterate(using: .breadthFirst)))
        XCTAssertEqual(Set(elements), Set(tree.iterate(using: .depthFirst)))
        XCTAssertEqual(Set(elements), Set(tree.iterate(using: .depthFirstNonRecursive)))
    }
}
