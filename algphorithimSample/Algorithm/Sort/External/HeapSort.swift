//
//  HeapSort.swift
//  algphorithimSample
//
//  Created by Yamaguchi Tomoki on 2020/10/01.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

/// ヒープソート
/// n個の要素をそれぞれ1/2log nで見つけて入れて、またn個の要素をそれぞれ1/2log nで取り出すので O(n log n)
final class HeapSort {
    func sort<Element: Comparable>(elements: [Element]) -> [Element] {
        let heap = elements.reduce(into: BinaryHeap<Element>()) { (heap, element) in
            heap.insert(element)
        }

        var sorted: [Element] = []
        while let element = heap.removeRoot() {
            sorted.append(element)
        }
        return sorted
    }
}
