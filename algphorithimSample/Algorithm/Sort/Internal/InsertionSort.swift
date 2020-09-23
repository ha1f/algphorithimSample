//
//  InsertionSort.swift
//  algphorithimSample
//
//  Created by はるふ on 2019/04/05.
//  Copyright © 2019 はるふ. All rights reserved.
//

import Foundation

/// 挿入ソート
/// 左から順にinsertによって、ソートされた範囲を広げていく
func insertionSort(_ numbers: inout [Int]) {
    (0..<numbers.count)
        .forEach { i in
            let value = numbers[i]
            // TODO: use binary-search to find larger value.
            for j in 0..<i {
                if numbers[j] > value {
                    numbers.remove(at: i)
                    numbers.insert(value, at: j)
                    return
                }
            }
            // If the value is already the largest, no need to change.
    }
}

/// non-internal version
//func insertionSort(_ numbers: [Int]) -> [Int] {
//    let numbersCount = numbers.count
//    var result = [Int]()
//    // We can reserve capacity in advance for performance
//    result.reserveCapacity(numbersCount)
//    (0..<numbersCount)
//        .forEach { i in
//            let value = numbers[i]
//            // length of result must be the same as i
//            for j in 0..<i {
//                if result[j] > value {
//                    result.insert(value, at: j)
//                    return
//                }
//            }
//            result.append(value)
//        }
//    return result
//}
