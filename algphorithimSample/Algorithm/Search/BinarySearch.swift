//
//  binarySearch.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/09/23.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

final class BinarySearch<Element: Comparable> {
    /// fromIndex <= i < toIndexの範囲でtargetを探索する。
    ///
    /// - returns: the index of the target in given sortedArray.
    private func _search(sortedArray: [Element], target: Element, from fromIndex: Int, to toIndex: Int) -> Int? {
        if (toIndex - fromIndex) < 2 {
            if sortedArray[fromIndex] == target {
                return fromIndex
            }
            return nil
        }
        // この時点でtoIndex >= fromIndex + 2より、fromIndex <= toIndex - 2
        // (fromIndex + toIndex) / 2 <= toIndex - 1
        // middleIndex <= toIndex - 1より必ず範囲内であり、境界チェックは必要ない
        let middleIndex = (fromIndex + toIndex) / 2
        let middleValue = sortedArray[middleIndex]
        if middleValue < target {
            // middleよりも右だけを見る
            let nextFromIndex = middleIndex + 1
            if nextFromIndex >= toIndex {
                // middleがすでに右端の場合は探索を終了
                return nil
            }
            return _search(sortedArray: sortedArray, target: target, from: nextFromIndex, to: toIndex)
        } else if middleValue > target {
            // middleよりも左だけを見る
            return _search(sortedArray: sortedArray, target: target, from: fromIndex, to: middleIndex)
        } else {
            return middleIndex
        }
    }

    /// sortedArrayは昇順にソート済みのRandomAccessCollectionである必要がある
    func searchIndex(of targetValue: Element, from sortedArray: [Element]) -> Int? {
        _search(sortedArray: sortedArray, target: targetValue, from: sortedArray.startIndex, to: sortedArray.endIndex)
    }
}
