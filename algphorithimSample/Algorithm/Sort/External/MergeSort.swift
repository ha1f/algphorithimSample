//
//  MergeSort.swift
//  algphorithimSample
//
//  Created by はるふ on 2019/04/03.
//  Copyright © 2019 はるふ. All rights reserved.
//

import Foundation

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

func mergeSort(_ numbers: [Int]) -> [Int] {
    let currentCount = numbers.count
    guard currentCount >= 2 else {
        return numbers
    }
    let separator = currentCount / 2
    let leftArray = Array(numbers[0..<separator])
    let rightArray = Array(numbers[separator..<currentCount])
    
    let sortedLeftArray = mergeSort(leftArray)
    let sortedRightArray = mergeSort(rightArray)
    var mergedArray = sortedLeftArray
    _merge(into: &mergedArray, sortedRightArray)
    return mergedArray
}
