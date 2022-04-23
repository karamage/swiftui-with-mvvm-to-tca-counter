//
//  CounterView2_MVVM.swift
//  swiftui-with-mvvm-to-tca-counter (iOS)
//
//  Created by Masaaki Kakimoto on 2022/04/23.
//

import SwiftUI

struct RandomCounterView_MVVM: View {
    @StateObject private var counterViewModel = CounterViewModel()
    var label: String
    
    var body: some View {
        HStack {
            Text("\(label):")
                .padding()
                .font(.subheadline)
            Button("-") { counterViewModel.decrementRandom10() }
            Text("\(counterViewModel.count)").font(.body.monospacedDigit())
            Button("+") { counterViewModel.incrementRandom10() }
        }
    }
}

struct RandomCounterView_MVVM_Previews: PreviewProvider {
    static var previews: some View {
        RandomCounterView_MVVM(label: "Random Counter")
    }
}
