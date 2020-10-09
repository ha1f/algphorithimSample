//
//  BinaryTree.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/10/09.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

struct ChildIndices {
    var left: Int?
    var right: Int?

    var validIndices: [Int] {
        [left, right].compactMap { $0 }
    }
}

/// Nodeを持ったやつとprotocolで管理できるようにしてみたい
class BinaryTree<Element> {
    /// 子クラスから参照するために公開している……
    var _array: [Element]

    var root: Element? {
        _array.first
    }

    var isEmpty: Bool {
        _array.isEmpty
    }

    init() {
        _array = []
    }

    func childIndices(of index: Int) -> ChildIndices {
        let firstChildIndex = index * 2 + 1
        let validIndex: (Int) -> Int? = { $0 < self._array.count ? $0 : nil }
        return .init(left: validIndex(firstChildIndex), right: validIndex(firstChildIndex + 1))
    }

    func parentIndex(of index: Int) -> Int? {
        guard index > 0 else {
            return nil
        }
        return (index - 1) / 2
    }

    /// 木構造を表示する
    func printAll() {
        print("-----------------------")
        guard !_array.isEmpty else {
            return
        }
        let width: Int = 1
        let treeDepth = Int(log2(Double(_array.count))) + 1
        let maxLeafCount = Int(pow(2, Double(treeDepth - 1)))
        let margin: Int = 1
        let treeWidth = (width + margin) * maxLeafCount - margin

        print("depth: \(treeDepth), count: \(_array.count)")

        for depth in 0..<treeDepth {
            let leafCount = Int(pow(2, Double(depth)))
            let leafDistance = (treeWidth + margin) / leafCount
            print(String.spaces((leafDistance - width) / 2), terminator: "")
            for i in 0..<leafCount {
                let index = leafCount - 1 + i
                if index > _array.count - 1 {
                    break
                }
                // FIXME: 中央寄せにする
                print(_array[index], terminator: "")
                if i == leafCount - 1 {
                    print(String.spaces((leafDistance - width) / 2), terminator: "")
                } else {
                    print(String.spaces(leafDistance - width), terminator: "")
                }
            }
            print("")
        }
    }
}

private extension String {
    static func spaces(_ width: Int) -> String {
        String(repeating: " ", count: width)
    }
}
