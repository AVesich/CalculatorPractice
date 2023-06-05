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
    @State var showingSettings: Bool = false
    @AppStorage("backgroundColor") var backgroundColor: String = Color("Background").asString()
    
    // MARK: - UI
    var body: some View {
        VStack(alignment: .trailing) {
            // Settings button
            HStack {
                Spacer()
                Button {
                    showingSettings = true
                } label: {
                    Image(systemName: "gearshape.fill")
                        .imageScale(.large)
                        .foregroundColor(Color("Text"))
                }
            }
            
            // Editing view
            CalculatorTextField(text: viewModel.numStr) // Main editor
                .frame(height: 100.0)
                .compositingGroup()
                .padding(.top, 48.0)
                .shadow(color: .black.opacity(0.5), radius: 7.0, y: 4.0)
            
            // Operation Chip
            ZStack(alignment: .center) {
                OperationChip(operation: viewModel.currentOperation)
            }
            .frame(height: 28.0)
            .padding(.vertical, 16.0)
            
            // Buttons
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
                    }
                }
            }
        }
        .padding(24.0)
        .background {
            backgroundColor.asColor()
            Image("Noise")
                .blendMode(.multiply)
                .opacity(0.3)
        }
        .sheet(isPresented: $showingSettings) {
            SettingsSheet()
        }
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
