//
//  intpow.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/10/02.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

/// 繰り返し二乗法を用いてx ^ nを計算する
/// 2進数で分割することで高速化を図る
func intpow(_ x: Int, _ n: UInt8) -> Int {
    var result: Int = 1
    var restN = n
    var xs: Int = x
    while restN > 0 {
        if (restN & 1) != 0 {
            result = result * xs
        }
        restN = restN >> 1
        xs = xs * xs
    }
    return result
}

