//
//  CounterViewModel.swift
//  swiftui-with-mvvm-to-tca-counter (iOS)
//
//  Created by Masaaki Kakimoto on 2022/04/22.
//

import SwiftUI

class CounterViewModel:ObservableObject {
    @Published var counter = Counter()

    var count: Int {
        return counter.count
    }

    func increment() {
        counter.increment()
    }
    
    func decrement() {
        counter.decrement()
    }
}
