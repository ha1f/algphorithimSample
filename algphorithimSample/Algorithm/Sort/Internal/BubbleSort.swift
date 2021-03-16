//
//  BubbleSort.swift
//  algphorithimSample
//
//  Created by はるふ on 2019/04/05.
//  Copyright © 2019 はるふ. All rights reserved.
//

import Foundation

/// バブルソート
/// 隣同士を比較して、大小が入れ替わってたらswapを繰り返す
/// それぞれの要素について残りの全要素との比較が必要なのでO(n^2)
/// 安定ソートである
func bubbleSort(_ numbers: inout [Int]) {
    let numbersCount = numbers.count
    for i in 0..<(numbersCount - 1) {
        for j in 0..<(numbersCount - i - 1) {
            if numbers[j] > numbers[j+1] {
                numbers.swapAt(j, j+1)
            }
        }
    }
}
