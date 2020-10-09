//
//  LinkingBinaryTree.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/10/09.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

class LinkingBinaryTree<Element> {
    final class Node {
        var element: Element

        var left: Node?
        var right: Node?

        init(_ element: Element) {
            self.element = element
            self.left = nil
            self.right = nil
        }
    }

    var root: Node?
}

final class BinarySearchTree<Element: Comparable>: LinkingBinaryTree<Element> {
    func find(element: Element) -> Node? {
        guard let rootNode = root else {
            return nil
        }
        return _find(element: element, from: rootNode)
    }

    private func _find(element: Element, from node: Node) -> Node? {
        if element == node.element {
            return node
        } else if element < node.element {
            guard let leftChild = node.left else {
                return nil
            }
            return _find(element: element, from: leftChild)
        } else {
            guard let rightChild = node.right else {
                return nil
            }
            return _find(element: element, from: rightChild)
        }
    }

    func insert(_ element: Element) {
        if let rootNode = root {
            let appending = _findNodeToAppend(element, from: rootNode)
            if appending.1 {
                appending.0.left = Node(element)
            } else {
                appending.0.right = Node(element)
            }
        } else {
            root = Node(element)
        }
    }

    private func _findNodeToAppend(_ element: Element, from node: Node) -> (Node, Bool) {
        if element < node.element {
            guard let leftChild = node.left else {
                return (node, true)
            }
            return _findNodeToAppend(element, from: leftChild)
        } else {
            guard let rightChild = node.right else {
                return (node, false)
            }
            return _findNodeToAppend(element, from: rightChild)
        }
    }
}

