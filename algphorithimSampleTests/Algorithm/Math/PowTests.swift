//
//  PowTests.swift
//  algphorithimSampleTests
//
//  Created by Yamaguchi Tomoki on 2020/10/02.
//  Copyright © 2020 はるふ. All rights reserved.
//

import XCTest

@testable import algphorithimSample

class PowTests: XCTestCase {

    func testIntPow() {
        XCTAssertEqual(intpow(1, 2), 1)
        XCTAssertEqual(intpow(2, 1), 2)
        XCTAssertEqual(intpow(2, 3), 8)
        XCTAssertEqual(intpow(2, 4), 16)
        XCTAssertEqual(intpow(9, 13), 2541865828329)
    }

}
