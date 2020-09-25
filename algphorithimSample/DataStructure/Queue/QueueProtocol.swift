//
//  QueueProtocol.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/09/23.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

protocol QueueProtocol {
    associatedtype Element
    /// 空かどうかを調べる
    var isEmpty: Bool { get }
    /// Queueの末尾にオブジェクトを追加する
    mutating func add(_ element: Element)
    /// Queueの先頭にあるオブジェクトを削除して取得する
    mutating func remove() -> Element?
    /// Queueの先頭にあるオブジェクトを削除せずに取得する
    func peek() -> Element?
}
