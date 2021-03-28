//
//  TwoStackQueue.swift
//  algphorithimSample
//
//  Created by ha1f on 2020/09/20.
//  Copyright © 2020 はるふ. All rights reserved.
//

import Foundation

/// 2つのstackでキューを作る
class TwoStackQueue<Element>: QueueProtocol {
    private var stack1: Stack<Element> = Stack()
    private var stack2: Stack<Element> = Stack()

    private var isInverted: Bool = false

    var isEmpty: Bool {
        stack1.isEmpty
    }

    func add(_ element: Element) {
        if isInverted {
            // stack2から1へ逆順コピー
            while let element = stack2.pop() {
                stack1.push(element)
            }
            isInverted = false
        }
        stack1.push(element)
    }

    func remove() -> Element? {
        if !isInverted {
            // 一番最初に入れたデータを取りたいので、最後以外をstack1から2に逆順コピーする
            // 最後の要素はそのまま返す
            var lastElement: Element? = nil
            while true {
                let element = stack1.pop()
                guard let unwrappedElement = element else {
                    break
                }
                if !stack1.isEmpty {
                    stack2.push(unwrappedElement)
                } else {
                    lastElement = unwrappedElement
                }
            }
            isInverted = true
            return lastElement
        } else {
            return stack2.pop()
        }
    }

    func peek() -> Element? {
        if !isInverted {
            // stack1から2へ逆順コピー
            while let element = stack1.pop() {
                stack2.push(element)
            }
            isInverted = false
        }
        return stack2.peek()
    }
}

