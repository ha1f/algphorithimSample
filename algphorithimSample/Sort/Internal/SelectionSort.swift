//
//  SelectionSort.swift
//  algphorithimSample
//
//  Created by はるふ on 2019/04/03.
//  Copyright © 2019 はるふ. All rights reserved.
//

import Foundation

/// 選択ソート
/// 最小から順番に探して、並べていく
func selectionSort(_ numbers: inout [Int]) {
    let numbersCount = numbers.count
    for currentOffset in (0..<(numbersCount - 1)) {
        // we cannot use enumerated() because we have to read latest value.
        var minimum = (offset: currentOffset, element: numbers[currentOffset])
        
        // seek right part
        // TODO: use binary-search
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
