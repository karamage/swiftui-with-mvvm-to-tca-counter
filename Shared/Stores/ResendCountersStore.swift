//
//  ResendCountersStore.swift
//  swiftui-with-mvvm-to-tca-counter (iOS)
//
//  Created by Masaaki Kakimoto on 2022/04/24.
//

import ComposableArchitecture
import SwiftUI

enum ResendCountersAction {
    case counter1(CounterAction)
    case counter2(CounterAction)
}

let resendCountersReducer = Reducer<CountersState, ResendCountersAction, CountersEnvironment>
    .combine(
        counterReducer.pullback(
            state: \CountersState.counter1,
            action: /ResendCountersAction.counter1,
            environment: { _ in CounterEnvironment() }
        ),
        randomCounterReducer.pullback(
            state: \CountersState.counter2,
            action: /ResendCountersAction.counter2,
            environment: { _ in CounterEnvironment() }
        )
    )
    .resending(/ResendCountersAction.counter2, to: /ResendCountersAction.counter1)
    

extension Reducer {
  func resending<Value>(
    _ extract: @escaping (Action) -> Value?,
    to embed: @escaping (Value) -> Action
  ) -> Self {
    .combine(
      self,
      .init { _, action, _ in
        if let value = extract(action) {
          return Effect(value: embed(value))
        } else {
          return .none
        }
      }
    )
  }

  func resending<Value>(
    _ `case`: CasePath<Action, Value>,
    to other: CasePath<Action, Value>
  ) -> Self {
    resending(`case`.extract(from:), to: other.embed(_:))
  }

  func resending<Value>(
    _ `case`: CasePath<Action, Value>,
    to other: @escaping (Value) -> Action
  ) -> Self {
    resending(`case`.extract(from:), to: other)
  }

  func resending<Value>(
    _ extract: @escaping (Action) -> Value?,
    to other: CasePath<Action, Value>
  ) -> Self {
    resending(extract, to: other.embed(_:))
  }
}
