//
//  GcdTests.swift
//  algphorithimSampleTests
//
//  Created by ha1f on 2020/10/02.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation
import XCTest

@testable import algphorithimSample

final class GcdTests: XCTestCase {
    func testGcd() {
        XCTAssertEqual(gcd(48, 32), 16)
        XCTAssertEqual(gcd(1, 2), 1)
        XCTAssertEqual(gcd(5, 10), 5)
    }
}

