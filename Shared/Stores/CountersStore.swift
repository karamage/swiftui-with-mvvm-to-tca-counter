//
//  CountersStore.swift
//  swiftui-with-mvvm-to-tca-counter (iOS)
//
//  Created by Masaaki Kakimoto on 2022/04/23.
//

import ComposableArchitecture
import SwiftUI

struct CountersState: Equatable {
    var counter1 = CounterState()
    var counter2 = CounterState()
}

enum CountersAction {
    case counter1(CounterAction)
    case counter2(CounterAction)
}

struct CountersEnvironment {}

let countersReducer = Reducer<CountersState, CountersAction, CountersEnvironment>
    .combine(
        counterReducer.pullback(
            state: \CountersState.counter1,
            action: /CountersAction.counter1,
            environment: { _ in CounterEnvironment() }
        ),
        randomCounterReducer.pullback(
            state: \CountersState.counter2,
            action: /CountersAction.counter2,
            environment: { _ in CounterEnvironment() }
        )
    )
