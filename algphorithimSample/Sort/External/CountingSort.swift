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
func countingSort(_ numbers: [Int], min: Int = 0, max: Int = 10) -> [Int] {
    var counts = [Int](repeating: 0, count: max - min + 1)
    for n in numbers {
        counts[n - min] += 1
    }
    return (min...max).flatMap { i in [Int](repeating: i, count: counts[i - min]) }
}
