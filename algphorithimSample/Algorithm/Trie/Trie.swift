//
//  Trie.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/09/23.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

final class Trie<Element, Path: Hashable> {
    var rootNode: Node

    init() {
        rootNode = Node()
    }

    func insert<C: Collection>(_ element: Element, at path: C) where C.Element == Path {
        var currentNode = rootNode
        for index in path.indices {
            let character = path[index]
            if let node = currentNode.children[character] {
                currentNode = node
                continue
            } else {
                currentNode.children[character] = Node(element, path: path, after: index)
                break
            }
        }
    }

    /// prefixで検索
    func find<C: Collection>(prefix: C) -> [Element] where C.Element == Path {
        guard let node = rootNode.findNode(prefix: prefix) else {
            return []
        }
        return node.subLeaves()
    }

    /// 後ろ何文字かが一致するものを検索（時間かかるので文字数減らしてから渡すこと）
    func find<C: Collection>(from string: C) -> [Element] where C.Element == Path {
        return string.indices.flatMap { index -> [Element] in
            guard let node = rootNode.findNode(prefix: string[index...]) else {
                return []
            }
            return node.subLeaves()
        }
    }

    func showPretty() {
        rootNode.showPretty(indent: 0)
    }
}

extension Trie where Element == String, Path: DecomposedStringProtocol {
    convenience init(_ strings: [String]) {
        self.init()
        insertBatch(strings)
    }

    func insertBatch(_ strings: [String]) {
        strings.forEach { string in
            insert(string)
        }
    }

    func insert(_ element: Element) {
        self.insert(element, at: Path.decompose(element))
    }

    func find(from string: String) -> [Element] {
        return self.find(from: Path.decompose(string))
    }

    func find(prefix: String) -> [Element] {
        return self.find(from: Path.decompose(prefix))
    }
}
