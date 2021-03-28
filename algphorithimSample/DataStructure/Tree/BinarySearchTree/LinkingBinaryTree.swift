//
//  LinkingBinaryTree.swift
//  algphorithimSample
//
//  Created by ha1f on 2021/03/28.
//  Copyright © 2021 はるふ. All rights reserved.
//

import Foundation

class LinkingBinaryTree<Element> {
    final class Node {
        var element: Element

        var parent: Node?
        var left: Node?
        var right: Node?

        init(_ element: Element, parent: Node?) {
            self.element = element
            self.left = nil
            self.right = nil
            self.parent = parent
        }
    }

    var root: Node?
}

extension LinkingBinaryTree {
    func size() -> Int {
        return size(from: root)
    }

    func size(from node: Node?) -> Int {
        guard let node = node else {
            return 0
        }
        return size(from: node.left) + size(from: node.right) + 1
    }
}
