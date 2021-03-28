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
        let tree = _buildExampleTree()

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

    private func _buildExampleTree() -> BinarySearchTree<Int> {
        let elements = (0..<30).shuffled()
        let tree = BinarySearchTree<Int>()
        for i in elements {
            tree.insert(i)
        }
        return tree
    }

    func testRemove() {
        let tree = _buildExampleTree()
        XCTAssertTrue(tree.check())

        do {
            try tree.remove(XCTUnwrap(tree.find(element: 3)))
            XCTAssertTrue(tree.check())
            XCTAssertNil(tree.find(element: 3))

            try tree.remove(XCTUnwrap(tree.find(element: 19)))
            XCTAssertTrue(tree.check())
            XCTAssertNil(tree.find(element: 19))

            try tree.remove(XCTUnwrap(tree.find(element: 0)))
            XCTAssertTrue(tree.check())
            XCTAssertNil(tree.find(element: 0))
        } catch {
            XCTFail(error.localizedDescription)
            print(error)
        }
    }

    func testSorted() {
        let tree = _buildExampleTree()
        XCTAssertEqual(tree.sorted(), Array((0..<30)))
    }
}

private extension BinarySearchTree {
    /// 左の部分木がすべて今の値より小さく、右の部分木がより大きいことを確認する
    func check() -> Bool {
        _allSatisfy(node: root, lessThan: nil, greaterThan: nil)
    }

    private func _string(_ element: Element?) -> String {
        element.map { "\($0)" } ?? "-"
    }

    private func _satisfy(_ element: Element, lessThan: Element?, greaterThan: Element?) -> Bool {
        if let lessThan = lessThan, element >= lessThan {
            print("check error: \(_string(greaterThan)) < \(element) < \(_string(lessThan))")
            return false
        }
        if let greaterThan = greaterThan, element <= greaterThan {
            print("check error: \(_string(greaterThan)) < \(element) < \(_string(lessThan))")
            return false
        }
        return true
    }

    private func _allSatisfy(node: LinkingBinaryTree<Element>.Node?, lessThan: Element?, greaterThan: Element?) -> Bool {
        guard let node = node else {
            return true
        }
        return _satisfy(node.element, lessThan: lessThan, greaterThan: greaterThan)
            && _allSatisfy(node: node.left, lessThan: node.element, greaterThan: greaterThan)
            && _allSatisfy(node: node.right, lessThan: lessThan, greaterThan: node.element)
    }
}
