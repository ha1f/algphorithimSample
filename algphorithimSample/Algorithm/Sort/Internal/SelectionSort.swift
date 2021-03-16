//
//  SelectionSort.swift
//  algphorithimSample
//
//  Created by はるふ on 2019/04/03.
//  Copyright © 2019 はるふ. All rights reserved.
//

import Foundation

/// 選択ソート
/// 残りの中からの最小を順番に探して、並べていく
/// n個の要素について平均n/2個から最小を見つけるので常にO(n^2)
/// 安定ソートではない
func selectionSort(_ numbers: inout [Int]) {
    let numbersCount = numbers.count
    // currentOffsetより左側がソートされた状態になる
    for currentOffset in (0..<(numbersCount - 1)) {
        // we cannot use enumerated() because we have to read from latest collection.
        var minimum = (offset: currentOffset, element: numbers[currentOffset])
        
        // seek right part to find the minimum value to place at currentOffset.
        for index in (currentOffset+1)..<numbersCount {
            let element = numbers[index]
            if element < minimum.element {
                minimum = (index, element)
            }
        }
        
        // Swap values if minimum was updated
        if minimum.offset != currentOffset {
            numbers.swapAt(currentOffset, minimum.offset)
        }
    }
}
