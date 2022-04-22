//
//  Counter.swift
//  swiftui-with-mvvm-to-tca-counter (iOS)
//
//  Created by Masaaki Kakimoto on 2022/04/22.
//

struct Counter {
    var count = 0

    mutating func increment() {
        self.count += 1
    }

    mutating func decrement() {
        self.count -= 1
    }
}
