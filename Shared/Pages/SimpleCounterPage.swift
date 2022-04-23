//
//  SimpleCounterView.swift
//  swiftui-with-mvvm-to-tca-counter (iOS)
//
//  Created by Masaaki Kakimoto on 2022/04/23.
//

import ComposableArchitecture
import SwiftUI

struct SimpleCounterPage: View {
    private let readMe = "Single Counter with TCA"
    var body: some View {
        Form {
            Section(header: Text(readMe)) {
                CounterView(
                    store: Store(
                        initialState: CounterState(),
                        reducer: counterReducer,
                        environment: CounterEnvironment()
                    ),
                    label:  "Counter"
                )
                    .buttonStyle(.borderless)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationBarTitle("SimpleCounter")
    }
}

struct SimpleCounterPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SimpleCounterPage()
        }
    }
}
