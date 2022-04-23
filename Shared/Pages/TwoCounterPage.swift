//
//  TwoCounterPage.swift
//  swiftui-with-mvvm-to-tca-counter (iOS)
//
//  Created by Masaaki Kakimoto on 2022/04/23.
//

import ComposableArchitecture
import SwiftUI

struct TwoCounterPage: View {
    private let readMe = "Two Counter with TCA"
    let store: Store<CountersState, CountersAction>
    var body: some View {
        Form {
            Section(header: Text(readMe)) {
                VStack {
                    CounterView(
                        store: self.store.scope(state: \.counter1, action: CountersAction.counter1)
                        ,
                        label:  "Counter"
                    )
                        .buttonStyle(.borderless)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    CounterView(
                        store: self.store.scope(state: \.counter2, action: CountersAction.counter2)
                        ,
                        label:  "Random Counter"
                    )
                        .buttonStyle(.borderless)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .navigationBarTitle("TwoCounter")
    }
}

struct TwoCounterPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TwoCounterPage(
                store: Store(
                    initialState: CountersState(),
                    reducer: countersReducer,
                    environment: CountersEnvironment()
                    )
            )
        }
    }
}
