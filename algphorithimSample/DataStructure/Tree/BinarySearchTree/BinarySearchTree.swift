//
//  BinarySearchTree.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/10/09.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

/// 左の部分木に含まれるデータはすべて小さく、右の部分木に含まれるデータはすべて大きい
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

    /// - returns: Succeeded in insertion or not.
    @discardableResult
    func insert(_ element: Element) -> Bool {
        if let rootNode = root {
            return _insert(element, toSubtreeOf: rootNode)
        } else {
            root = Node(element, parent: nil)
            return true
        }
    }

    private func _insert(_ element: Element, toSubtreeOf node: Node) -> Bool {
        guard let appending = _findNodeToAppend(element, from: node) else {
            return false
        }
        if appending.1 {
            appending.0.left = Node(element, parent: appending.0)
        } else {
            appending.0.right = Node(element, parent: appending.0)
        }
        return true
    }

    private func _findNodeToAppend(_ element: Element, from node: Node) -> (Node, Bool)? {
        if element < node.element {
            guard let leftChild = node.left else {
                return (node, true)
            }
            return _findNodeToAppend(element, from: leftChild)
        } else if element > node.element {
            guard let rightChild = node.right else {
                return (node, false)
            }
            return _findNodeToAppend(element, from: rightChild)
        } else {
            // 同じ値が見つかればスルーする
            return nil
        }
    }

    func remove(_ node: Node) {
        guard let parent = node.parent else {
            assert(node === root)
            // removing root node?
            root = nil
            return
        }
        guard let rightNode = node.right, node.left != nil else {
            // 子供が1つ以下のときはそのままparentに付け替える
            let childNode = node.left ?? node.right
            if parent.left === node {
                parent.left = childNode
                childNode?.parent = parent
            } else {
                assert(parent.right === node)
                parent.right = childNode
                childNode?.parent = parent
            }
            return
        }
        // 2つとも子供がいる時、右の最小値を持ってくる
        // (と、性質を維持することができる)
        let minDescendantNode = _minNode(from: rightNode)

        // 構造は変わらないので値だけコピーしてくる
        node.element = minDescendantNode.element
        _splice(node: minDescendantNode)
    }

    /// その要素を飛ばす
    private func _splice(node: Node) {
        guard let parent = node.parent else {
            assert(node === root)
            root = nil
            return
        }
        assert(node.left == nil || node.right == nil)
        let child = node.left ?? node.right
        if node === parent.left {
            parent.left = child
        } else {
            assert(node === parent.right)
            parent.right = child
        }
        child?.parent = parent
    }

    private func _minNode(from node: Node) -> Node {
        guard let leftNode = node.left else {
            return node
        }
        return _minNode(from: leftNode)
    }
}

extension BinarySearchTree {
    func contains(_ element: Element) -> Bool {
        find(element: element) != nil
    }
}

extension BinarySearchTree {
    /// 小さい順に返す
    func sorted() -> [Element] {
        guard let root = root else {
            return []
        }
        var array: [Element] = []
        _appendSorted(root, array: &array)
        return array
    }

    /// node以下のsubtreeの要素をソートして追加する
    /// arrayを返してそれを連結をしたほうが実装は楽だが、パフォーマンスのためinoutにしている
    private func _appendSorted(_ node: Node, array: inout [Element]) {
        if let left = node.left {
            _appendSorted(left, array: &array)
        }
        array.append(node.element)
        if let right = node.right {
            _appendSorted(right, array: &array)
        }
    }
}
