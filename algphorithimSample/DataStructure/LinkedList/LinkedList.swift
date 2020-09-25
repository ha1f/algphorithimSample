//
//  LinkedList.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/09/25.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

final class LinkedList<Element> {
    final class Node {
        var element: Element
        var previous: Node?
        var next: Node?

        /// 再帰的に一番最後まで辿る
        var recursiveLastNode: Node {
            var currentNode: Node = self
            while let node = currentNode.next {
                currentNode = node
            }
            return currentNode
        }

        /// 後ろに続くNodeを順番に見ていく
        fileprivate func iterateSubsequents(_ handler: (Node) -> Void) {
            var currentNode: Node = self
            handler(currentNode)
            while let node = currentNode.next {
                currentNode = node
                handler(node)
            }
        }

        init(_ element: Element) {
            self.element = element
            self.next = nil
            self.previous = nil
        }

        init(element: Element, next: Node, previous: Node? = nil) {
            self.element = element
            self.next = next
            self.previous = previous
        }

        init(element: Element, previous: Node) {
            self.element = element
            self.next = nil
            self.previous = previous
        }
    }

    private var initialNode: Node?

    init() {
        initialNode = nil
    }

    var isEmpty: Bool {
        initialNode == nil
    }

    var first: Element? {
        initialNode?.element
    }

    var last: Element? {
        initialNode?.recursiveLastNode.element
    }

    var count: Int {
        var count = 0
        initialNode?.iterateSubsequents({ _ in
            count += 1
        })
        return count
    }

    private func getNode(at index: Int) -> Node? {
        if index < 0 {
            return nil
        }
        if index == 0 {
            return initialNode
        }
        guard var currentNode = initialNode else {
            return nil
        }
        for _ in 0..<index {
            if let nextNode = currentNode.next {
                currentNode = nextNode
                continue
            }
            return nil
        }
        return currentNode
    }

    func getElement(at index: Int) -> Element? {
        getNode(at: index)?.element
    }

    func asArray() -> [Element] {
        var array: [Element] = []
        initialNode?.iterateSubsequents({ node in
            array.append(node.element)
        })
        return array
    }

    func showAll() {
        initialNode?.iterateSubsequents({ node in
            print("\(String(describing: node.previous?.element)) - \(node.element) - \(String(describing: node.next?.element))")
        })
    }

    func append(_ element: Element) {
        if let initialNode = initialNode {
            let currentLastNode = initialNode.recursiveLastNode
            let node = Node(element: element, previous: currentLastNode)
            currentLastNode.next = node
        } else {
            initialNode = Node(element)
        }
    }

    func insert(_ element: Element, at index: Int) {
        if index < 0 {
            assertionFailure("index must be greater than or equal to 0.")
            return
        } else if index == 0 {
            if let initialNode = initialNode {
                let node = Node(element: element, next: initialNode)
                initialNode.previous = node
                self.initialNode = node
            } else {
                let node = Node(element)
                initialNode = node
            }
        } else {
            // appendには非対応
            guard let nextNode = getNode(at: index) else {
                assertionFailure("Invalid index")
                return
            }
            let previousNode = nextNode.previous
            let node = Node(element: element, next: nextNode, previous: previousNode)
            previousNode?.next = node
            nextNode.previous = node
            showAll()
        }
    }
}
