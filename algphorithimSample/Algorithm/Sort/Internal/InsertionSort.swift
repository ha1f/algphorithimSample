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
/// n個の要素について挿入位置を平均n/2で探すのでO(n^2)
/// 但しもともと揃っている場合は挿入位置探す操作がO(1)になるのでO(n)になる
func insertionSort(_ numbers: inout [Int]) {
    // 0<=index<iまではソートされている状態で、i番目の数をどこに挿入するかを決める
    (0..<numbers.count)
        .forEach { i in
            let value = numbers[i]
            // i番目の数をどこに挿入するかを探す
            // TODO: use binary-search to find larger value.
            // TODO: 逆順に見て安定ソートにする
            for j in 0..<i {
                if numbers[j] > value {
                    // 差し込む
                    numbers.remove(at: i)
                    numbers.insert(value, at: j)
                    return
                }
            }
            // If the value is already the largest, no need to change.
    }
}

/// external version
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
