//
//  QuickSort.swift
//  algphorithimSample
//
//  Created by はるふ on 2019/03/31.
//  Copyright © 2019 はるふ. All rights reserved.
//

import Foundation

private func _quickSort(_ numbers: inout [Int], start: Int, end: Int) {
    if (end - start) < 1 {
        return
    }
    let pivotIndex = start
    let pivot = numbers[pivotIndex]
    
    var leftIndex = start
    var rightIndex = end
    
    var separatorIndex = pivotIndex
    
    while leftIndex < rightIndex {
        while leftIndex <= end {
            if numbers[leftIndex] > pivot {
                break
            }
            leftIndex += 1
        }
        while rightIndex >= start {
            if numbers[rightIndex] < pivot {
                separatorIndex = rightIndex
                break
            }
            rightIndex -= 1
        }
        if leftIndex < rightIndex {
            numbers.swapAt(leftIndex, rightIndex)
            leftIndex += 1
            rightIndex -= 1
        }
    }
    numbers.swapAt(pivotIndex, separatorIndex)
    _quickSort(&numbers, start: start, end: separatorIndex - 1)
    _quickSort(&numbers, start: separatorIndex + 1, end: end)
}

/// クイックソート
/// pivotより大きい組を右に、小さい組を左に分ける作業を再帰的に行う
/// log n回、n個の大小比較を繰り返すのでO(n log n)
/// 但しピボットが偏り続けた場合はO(n^n)
/// 安定ソートではない
func quickSort(_ numbers: inout [Int]) {
    guard !numbers.isEmpty else {
        return
    }
    _quickSort(&numbers, start: 0, end: numbers.count - 1)
}

/// non-internal version
//func quickSort(_ inputArray: [Int]) -> [Int] {
//    guard let pivot = inputArray.first else {
//        return []
//    }
//    var smallers: [Int] = []
//    var largers: [Int] = []
//    for element in inputArray.dropFirst() {
//        if element < pivot {
//            smallers.append(element)
//        } else {
//            largers.append(element)
//        }
//    }
//    return quickSort(smallers) + [pivot] + quickSort(largers)
//}
