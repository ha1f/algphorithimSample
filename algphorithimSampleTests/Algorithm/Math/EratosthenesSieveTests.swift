//
//  EratosthenesSieveTests.swift
//  algphorithimSampleTests
//
//  Created by Yamaguchi Tomoki on 2020/09/25.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation
import XCTest

@testable import algphorithimSample

final class EratosthenesSieveTests: XCTestCase {
    func testPerformance() {
        measure {
            let sieve = EratosthenesSieve(maximum: 50000)
            _ = sieve.solve()
        }
    }

    func testSolve() {
        let sieve = EratosthenesSieve(maximum: 100)
        XCTAssertEqual(
            sieve.solve(),
            [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
        )
    }
}
