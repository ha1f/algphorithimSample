//
//  BinaryHeap.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/09/30.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

/// 最大ヒープ
final class BinaryHeap<Element: Comparable> {
    private var _array: [Element]

    var root: Element? {
        _array.first
    }

    init() {
        _array = []
    }

    private func _childIndices(of index: Int) -> [Int] {
        let firstChildIndex = index * 2 + 1
        return [firstChildIndex, firstChildIndex + 1].filter { $0 < _array.count }
    }

    private func _parentIndex(of index: Int) -> Int? {
        guard index > 0 else {
            return nil
        }
        return (index - 1) / 2
    }

    /// 要素を追加する
    func insert(_ element: Element) {
        let elementIndex = _array.count
        _array.append(element)
        _upHeap(from: elementIndex)
    }

    /// rootを取り除く
    func removeRoot() -> Element? {
        if _array.isEmpty {
            return nil
        } else if _array.count == 1 {
            return _array.removeFirst()
        } else {
            // 末尾をルートに持ってくる
            let previousRoot = _array.first!
            _array[0] = _array.removeLast()
            _downHeap(from: 0)
            return previousRoot
        }
    }

    /// 親を見て、必要に応じて交換を行う
    private func _upHeap(from index: Int) {
        var currentIndex: Int = index
        while let parentIndex = _parentIndex(of: currentIndex),
            _array[parentIndex] < _array[currentIndex] {
            _array.swapAt(currentIndex, parentIndex)
            currentIndex = parentIndex
        }
    }

    /// 子を見て、必要に応じて交換を行う
    @discardableResult
    private func _downHeap(from index: Int) -> Bool {
        var swapped: Bool = false
        var currentIndex: Int = index
        // より大きい子と交換を行う
        while let inversedChildrenIndex = _childIndices(of: currentIndex).max(by: { lhs, rhs in _array[lhs] < _array[rhs] }),
            _array[inversedChildrenIndex] > _array[currentIndex] {
            _array.swapAt(currentIndex, inversedChildrenIndex)
            currentIndex = inversedChildrenIndex
            swapped = true
        }
        return swapped
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

