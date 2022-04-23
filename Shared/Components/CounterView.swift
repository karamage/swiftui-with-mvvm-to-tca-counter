//
//  CounterView.swift
//  swiftui-with-mvvm-to-tca-counter (iOS)
//
//  Created by Masaaki Kakimoto on 2022/04/22.
//

import ComposableArchitecture
import SwiftUI

struct CounterView: View {
    let store: Store<CounterState, CounterAction>
    var label: String
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            HStack {
                Text("\(label):")
                    .padding()
                    .font(.subheadline)
                Button("-") { viewStore.send(.decrementButtonTapped)}
                Text("\(viewStore.count)").font(.body.monospacedDigit())
                Button("+") { viewStore.send(.incrementButtonTapped) }
            }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(
            store: Store(
                initialState: CounterState(),
                reducer: counterReducer,
                environment: CounterEnvironment()
            ),
            label:  "Counter"
        )
    }
}
