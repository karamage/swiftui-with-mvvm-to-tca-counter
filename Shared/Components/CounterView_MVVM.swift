//
//  CounterView_MVVM.swift
//  swiftui-with-mvvm-to-tca-counter (iOS)
//
//  Created by Masaaki Kakimoto on 2022/04/22.
//

import SwiftUI

struct CounterView_MVVM: View {
    @StateObject private var counterViewModel = CounterViewModel()
    var label: String
    
    var body: some View {
        HStack {
            Text("\(label):")
                .padding()
                .font(.subheadline)
            Button("-") { counterViewModel.decrement() }
            Text("\(counterViewModel.count)").font(.body.monospacedDigit())
            Button("+") { counterViewModel.increment() }
        }
    }
}

struct CounterView_MVVM_Previews: PreviewProvider {
    static var previews: some View {
        CounterView_MVVM(label: "Counter")
    }
}
