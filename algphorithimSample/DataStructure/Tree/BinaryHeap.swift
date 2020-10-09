//
//  BinaryHeap.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/09/30.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

/// 最大ヒープ
final class BinaryHeap<Element: Comparable>: BinaryTree<Element> {
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
        while let parentIndex = parentIndex(of: currentIndex),
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
        while let inversedChildrenIndex = childIndices(of: currentIndex).validIndices.max(by: { lhs, rhs in _array[lhs] < _array[rhs] }),
            _array[inversedChildrenIndex] > _array[currentIndex] {
            _array.swapAt(currentIndex, inversedChildrenIndex)
            currentIndex = inversedChildrenIndex
            swapped = true
        }
        return swapped
    }
}
