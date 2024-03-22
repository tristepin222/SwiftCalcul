//
//  ContentView.swift
//  Calculator
//
//  Created by Afraz Siddiqui on 3/5/21.
//

import SwiftUI


struct ContentView: View {

    var body: some View {
        let operation = Operation(operationType: .none, buttonType: .zero)
        let viewModel = OperationViewModel(operation: operation)
        OperationView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
