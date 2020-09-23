//
//  TrieTests.swift
//  algphorithimSampleTests
//
//  Created by ha1f on 2020/09/23.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation
import XCTest
@testable import algphorithimSample

final class TrieTests: XCTestCase {
    func testTrie() {
        let trie = Trie<String, UTF16.CodeUnit>()
        trie.insert("CEZANNE")
        trie.insert("CANMAKE")
        trie.insert("Dior")
        trie.insert("ELIXIR")

        XCTAssertEqual(trie.find(from: "fffCE"), ["CEZANNE", "ELIXIR"])

        // 順不同
        XCTAssertEqual(Set(trie.find(from: "C")), Set(["CEZANNE", "CANMAKE"]))
    }
}
