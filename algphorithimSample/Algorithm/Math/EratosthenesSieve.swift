//
//  EratosthenesSieve.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/09/25.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

/// エラトステネスの篩
/// maximum未満の素数を列挙する
final class EratosthenesSieve {
    private var _solved: Bool
    private var possibles: [Int]
    private(set) var primes: [Int]

    init(maximum: Int) {
        if maximum > 2 {
            // TODO: この段階で余計なやつを削っておく(6n +- 1などにする)
            // popの効率のため、逆順にしておく
            possibles = (2..<maximum).reversed()
            primes = []
            _solved = false
        } else if maximum == 2 {
            possibles = []
            primes = [2]
            _solved = true
        } else {
            possibles = []
            primes = []
            _solved = true
        }
    }

    func solve() -> [Int] {
        guard !_solved else {
            return primes
        }
        while let foundPrime = possibles.popLast() {
            primes.append(foundPrime)
            possibles = possibles.filter { ($0 % foundPrime) != 0 }
        }
        _solved = true
        return primes
    }
}
