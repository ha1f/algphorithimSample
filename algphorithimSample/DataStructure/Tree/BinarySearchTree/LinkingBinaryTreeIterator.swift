//
//  LinkingBinaryTreeIterator.swift
//  algphorithimSample
//
//  Created by ha1f on 2021/03/28.
//  Copyright © 2021 はるふ. All rights reserved.
//

import Foundation

extension LinkingBinaryTree {
    private func iterate<I: LinkingBinaryTreeIterator>(using iterator: I) -> [Element] where I.Element == Element {
        iterator.allElements(tree: self)
    }

    func iterate(using iteratorType: LinkingBinaryTreeIteratorType) -> [Element] {
        switch iteratorType {
        case .breadthFirst:
            return iterate(using: LinkingBinaryTreeIteratorBreadthFirst())
        case .depthFirst:
            return iterate(using: LinkingBinaryTreeIteratorDepthFirst())
        case .depthFirstNonRecursive:
            return iterate(using: LinkingBinaryTreeIteratorDepthFirstNonRecursive())
        }
    }
}

enum LinkingBinaryTreeIteratorType {
    case depthFirst
    case depthFirstNonRecursive
    case breadthFirst
}

protocol LinkingBinaryTreeIterator {
    associatedtype Element
    func allElements(tree: LinkingBinaryTree<Element>) -> [Element]
}

/// 再帰を使わない深さ優先探索
final class LinkingBinaryTreeIteratorDepthFirstNonRecursive<Element>: LinkingBinaryTreeIterator {
    func allElements(tree: LinkingBinaryTree<Element>) -> [Element] {
        var results: [Element] = []
        var previousNode: LinkingBinaryTree<Element>.Node? = nil
        var currentNode: LinkingBinaryTree<Element>.Node? = tree.root
        while true {
            guard let node = currentNode else {
                break
            }

            if previousNode === node.parent {
                results.append(node.element)
                if let leftNode = node.left {
                    // 左を探索
                    currentNode = leftNode
                } else if let rightNode = node.right {
                    // 右を探索
                    currentNode = rightNode
                } else {
                    // 上に戻す
                    currentNode = node.parent
                }
            } else if previousNode === node.left, let rightNode = node.right {
                // 右を探索
                currentNode = rightNode
            } else {
                // 上に戻す
                currentNode = node.parent
            }
            previousNode = node
        }
        return results
    }
}

/// 深さ優先探索
final class LinkingBinaryTreeIteratorDepthFirst<Element>: LinkingBinaryTreeIterator {
    func allElements(tree: LinkingBinaryTree<Element>) -> [Element] {
        _allElements(node: tree.root)
    }

    private func _allElements(node: LinkingBinaryTree<Element>.Node?) -> [Element] {
        guard let node = node else {
            return []
        }
        return [node.element] + _allElements(node: node.left) + _allElements(node: node.right)
    }
}

/// 幅優先探索
final class LinkingBinaryTreeIteratorBreadthFirst<Element>: LinkingBinaryTreeIterator {
    func allElements(tree: LinkingBinaryTree<Element>) -> [Element] {
        guard let node = tree.root else {
            return []
        }
        var values: [Element] = []
        var queue = Queue<LinkingBinaryTree<Element>.Node>()
        queue.add(node)
        while let removed = queue.remove() {
            values.append(removed.element)
            if let left = removed.left {
                queue.add(left)
            }
            if let right = removed.right {
                queue.add(right)
            }
        }
        return values
    }
}

