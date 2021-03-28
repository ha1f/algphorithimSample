//
//  ScapegoatTree.swift
//  algphorithimSample
//
//  Created by Yamaguchi Tomoki on 2021/03/28.
//  Copyright © 2021 はるふ. All rights reserved.
//

import Foundation

/// 未実装
final class ScapegoatTree<Element: Comparable>: BinarySearchTree<Element> {
    func rebuild() {
        guard let root = root else {
            return
        }
        rebuild(from: root)
    }

    /// node以下を平衡にする
    func rebuild(from node: Node) {
        let sorted = self.sorted(from: node)
        guard !sorted.isEmpty else {
            // no need to rebuild
            return
        }
        let newRoot = _buildNodeFromSorted(sorted, start: 0, end: sorted.count, parent: node.parent)
        if let parent = node.parent {
            if parent.left === node {
                parent.left = newRoot
            } else {
                assert(parent.right === node)
                parent.right = newRoot
            }
        } else {
            root = newRoot
        }
    }

    private func _buildNodeFromSorted(_ elements: [Element], start: Int, end: Int, parent: Node?) -> Node {
        if end - start <= 1 {
            return Node(elements[start], parent: parent)
        }
        let pivot = (end + start) / 2
        let node = Node(elements[pivot], parent: parent)
        if pivot > start {
            node.left = _buildNodeFromSorted(elements, start: start, end: pivot, parent: node)
        } else {
            node.left = nil
        }
        if pivot < elements.count - 1 {
            node.right = _buildNodeFromSorted(elements, start: pivot + 1, end: end, parent: node)
        } else {
            node.right = nil
        }
        return node
    }
}
