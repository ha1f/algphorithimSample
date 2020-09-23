//
//  BinarySearchTests.swift
//  algphorithimSampleTests
//
//  Created by ha1f on 2020/09/23.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation
import XCTest

@testable import algphorithimSample

class BinarySearchTests: XCTestCase {
    func testSearch() {
        let binarySearch = BinarySearch<Int>()
        let sortedArray = [1, 2, 4, 5, 6, 9, 10]

        // exist
        for value in sortedArray.enumerated().shuffled() {
            let searchedIndex = binarySearch.searchIndex(of: value.element, from: sortedArray)
            XCTAssertEqual(searchedIndex, value.offset)
        }

        // not exist
        XCTAssertNil(binarySearch.searchIndex(of: -100, from: sortedArray))
        XCTAssertNil(binarySearch.searchIndex(of: 0, from: sortedArray))
        XCTAssertNil(binarySearch.searchIndex(of: 3, from: sortedArray))
        XCTAssertNil(binarySearch.searchIndex(of: 11, from: sortedArray))
        XCTAssertNil(binarySearch.searchIndex(of: .max, from: sortedArray))
    }

    func testSearchLarge() {
        let filteredValue: Int = 114514
        let binarySearch = BinarySearch<Int>()
        let sortedArray = (0..<50000)
            .map { _ in Int.random(in: 0..<Int.max) }
            .filter { $0 != filteredValue }
            .sorted()

        // 適当な場所の数字を検索
        XCTAssertEqual(
            binarySearch.searchIndex(of: sortedArray[400], from: sortedArray),
            400
        )
        XCTAssertEqual(
            binarySearch.searchIndex(of: sortedArray[49999], from: sortedArray),
            49999
        )
        XCTAssertEqual(
            binarySearch.searchIndex(of: sortedArray[0], from: sortedArray),
            0
        )
        XCTAssertEqual(
            binarySearch.searchIndex(of: sortedArray[1], from: sortedArray),
            1
        )

        // ないやつ
        XCTAssertNil(binarySearch.searchIndex(of: Int.max, from: sortedArray))
        XCTAssertNil(binarySearch.searchIndex(of: filteredValue, from: sortedArray))
        XCTAssertNil(binarySearch.searchIndex(of: -3, from: sortedArray))
    }
}
