//
//  Trie+Node.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/09/23.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

extension Trie {
    class Node {
        var element: Element?
        var children: [Path: Node]

        init() {
            self.element = nil
            self.children = [:]
        }

        /// 再帰的に直列なNode列を作る(string[index + 1]を根とする部分木を作成)
        init<C: Collection>(_ element: Element, path: C, after index: C.Index) where C.Element == Path {
            let nextIndex = path.index(after: index)
            if nextIndex == path.endIndex {
                self.element = element
                self.children = [:]
            } else {
                self.element = nil
                self.children = [path[nextIndex]: Node(element, path: path, after: nextIndex)]
            }
        }

        /// そのノードの下についてる文字列一覧を返す
        func subLeaves() -> [Element] {
            guard !children.isEmpty else {
                return element.map { [$0] } ?? []
            }
            return children.values.flatMap { child -> [Element] in
                return child.subLeaves()
            }
        }

        /// 自身を根とする部分木のから、対応するprefix分動いたノードを探す
        func findNode<C: Collection>(prefix: C) -> Node? where C.Element == Path {
            guard let firstCharacter = prefix.first else {
                return self
            }
            let remaining = prefix.dropFirst()
            if let node = children[firstCharacter]?.findNode(prefix: remaining) {
                return node
            }
            return nil
        }

        /// 改行を少なく表示
        func showPretty(indent: Int) {
            guard !children.isEmpty else {
                print("") // 葉で改行
                return
            }
            var isFirst: Bool = true
            for node in children {
                if isFirst {
                    print("\(node.key)", terminator: "")
                    isFirst = false
                } else {
                    let spaces = [String](repeating: " ", count: indent).joined()
                    print(spaces + "\(node.key)", terminator: "")
                }
                node.value.showPretty(indent: indent + 1)
            }
        }
    }
}
