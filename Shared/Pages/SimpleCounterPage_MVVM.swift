//
//  SimpleCounterPage_MVVM.swift
//  swiftui-with-mvvm-to-tca-counter (iOS)
//
//  Created by Masaaki Kakimoto on 2022/04/22.
//

import SwiftUI

struct SimpleCounterPage_MVVM: View {
    private let readMe = "Single Counter with MVVM"
    var body: some View {
        Form {
            Section(header: Text(readMe)) {
                CounterView_MVVM(label:  "Counter")
                    .buttonStyle(.borderless)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationBarTitle("SimpleCounter")
    }
}

struct SimpleCounterPage_MVVM_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SimpleCounterPage_MVVM()
        }
    }
}
