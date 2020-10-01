//
//  gcd.swift
//  algphorithimSample
//
//  Created by Yamaguchi Tomoki on 2020/10/02.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

/// ユークリッドの互除法により最大公約数を求める
func gcd(_ a: Int, _ b: Int) -> Int {
    b == 0 ? a : gcd(b, a%b)
}
