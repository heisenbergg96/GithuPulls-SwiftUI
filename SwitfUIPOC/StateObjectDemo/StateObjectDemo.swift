//
//  StateObjectDemo.swift
//  SwitfUIPOC
//
//  Created by Vikhyath Shetty on 12/12/22.
//

import SwiftUI

final class CounterViewModel: ObservableObject {
    private(set) var count = 0

    func incrementCounter() {
        count += 1
        objectWillChange.send()
    }
}

struct CounterView: View {
    /// Using @StateObject instead of @ObservedObject
    @StateObject var viewModel = CounterViewModel()

    var body: some View {
        VStack {
            Text("Count is: \(viewModel.count)")
            Button("Increment Counter") {
                viewModel.incrementCounter()
            }
        }
    }
}

struct RandomNumberView: View {
    @State private var randomNumber = 0

    var body: some View {
        VStack {
            Text("Random number is: \(randomNumber)")
            Button("Randomize number") {
                randomNumber = (0..<1000).randomElement()!
            }
            CounterView()
        }.padding(.bottom)
    }
}

struct StateObjectDemo: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct StateObjectDemo_Previews: PreviewProvider {
    static var previews: some View {
        RandomNumberView()
    }
}


// @state
