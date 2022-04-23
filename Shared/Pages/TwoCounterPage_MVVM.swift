//
//  TwoCounterPage.swift
//  swiftui-with-mvvm-to-tca-counter (iOS)
//
//  Created by Masaaki Kakimoto on 2022/04/23.
//

import SwiftUI

struct TwoCounterPage_MVVM: View {
    private let readMe = "Two Counter with MVVM"
    var body: some View {
        Form {
            Section(header: Text(readMe)) {
                VStack {
                    CounterView_MVVM(label:  "Counter")
                        .buttonStyle(.borderless)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    RandomCounterView_MVVM(label:  "Random Counter")
                        .buttonStyle(.borderless)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .navigationBarTitle("TwoCounter")
    }
}

struct TwoCounterPage_MVVM_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TwoCounterPage_MVVM()
        }
    }
}
