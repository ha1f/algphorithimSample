//
//  CountingSort.swift
//  algphorithimSample
//
//  Created by はるふ on 2019/04/25.
//  Copyright © 2019 はるふ. All rights reserved.
//

import Foundation

/// 分布数え上げソート
/// 各アイテムの出現頻度をカウントし、それをもとにソート後の配列を作る
struct CountingSort {
    var minValue: Int
    var maxValue: Int

    func sort(elements: [Int]) -> [Int] {
        let counts: [Int] = elements.reduce(into: [Int](repeating: 0, count: maxValue - minValue + 1)) { (counts, n) in
            counts[n - minValue] += 1
        }
        return (minValue...maxValue).flatMap { i in [Int](repeating: i, count: counts[i - minValue]) }
    }
}
