//
//  ContentView.swift
//  Calculator
//
//  Created by Austin Vesich on 5/31/23.
//

import SwiftUI

struct CalculatorView: View {
    
    // MARK: - Declaring Variables
    @StateObject var viewModel: CalculatorViewModel = CalculatorViewModel()
    
    // MARK: - UI
    var body: some View {
        VStack {
            // Settings button
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "gearshape.fill")
                        .imageScale(.large)
                        .foregroundColor(Color("Text"))
                }
            }
            
            // Editing view
            CalculatorTextField(text: viewModel.numStr) // Main editor
                .shadow(color: .black.opacity(0.2), radius: 7.0, y: 4.0)
                .frame(height: 100.0)
                .padding(.horizontal, 8.0)
                .padding(.vertical, 48.0)
            
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 24.0) {
                    ForEach(viewModel.operations, id: \.self) { operationRow in
                        HStack (alignment: .center, spacing: 24.0) {
                            ForEach(operationRow, id: \.self) { operation in
                                let btnOp = { viewModel.perform(operation.operation) }
                                CalculatorButton(symbol: operation.symbol, vmOp: btnOp)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.horizontal, 8.0)
                    }
                }
            }
        }
        .padding()
        .background {
            Color("Background")
            Image("Noise")
                .blendMode(.multiply)
                .opacity(0.3)
        }
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
