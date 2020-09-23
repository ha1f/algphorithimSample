//
//  DecomposedStringProtocol.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/09/23.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

protocol DecomposedStringProtocol: Hashable {
    associatedtype C: Collection where C.Element == Self
    static func decompose(_ string: String) -> C
}

extension UTF16.CodeUnit: DecomposedStringProtocol {
    static func decompose(_ string: String) -> String.UTF16View {
        string.utf16
    }
}

extension UTF8.CodeUnit: DecomposedStringProtocol {
    static func decompose(_ string: String) -> String.UTF8View {
        string.utf8
    }
}

extension Character: DecomposedStringProtocol {
    static func decompose(_ string: String) -> String {
        string
    }
}
