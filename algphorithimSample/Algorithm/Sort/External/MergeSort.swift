//
//  MergeSort.swift
//  algphorithimSample
//
//  Created by はるふ on 2019/04/03.
//  Copyright © 2019 はるふ. All rights reserved.
//

import Foundation

final class MergeSort {
    /// ２つのソート済みのArrayをあわせる。
    /// array1にarray2を混ぜる。
    private func _merge<S: Sequence, Element: Comparable>(into array1: inout [Element], _ array2: S) where S.Element == Element {
        var length = array1.count // リアルタイムのarray1の長さ
        var leftIndex: Int = 0
        array2.forEach { element in
            while leftIndex < length {
                defer {
                    leftIndex += 1
                }
                if array1[leftIndex] >= element {
                    array1.insert(element, at: leftIndex)
                    length += 1
                    return
                }
            }
            // Append if there is no larger.
            array1.append(element)
        }
    }

    /// 真ん中で分けて、左右それぞれ再帰的にソートし、それらを合成する
    func sort<C: Collection>(_ elements: C) -> [C.Element] where C.Element: Comparable, C.Index == Int {
        let currentCount = elements.count
        guard currentCount >= 2 else {
            return Array(elements)
        }
        let separator = elements.startIndex.advanced(by: currentCount / 2)
        let sortedLeftArray = sort(elements[elements.startIndex..<separator])
        let sortedRightArray = sort(elements[separator..<elements.endIndex])
        
        var mergedArray = sortedLeftArray
        _merge(into: &mergedArray, sortedRightArray)
        return mergedArray
    }
}
