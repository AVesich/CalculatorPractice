//
//  Button.swift
//  Calculator
//
//  Created by Austin Vesich on 5/31/23.
//

import SwiftUI

struct CalculatorButton: View {
    
    // MARK: - Declaring Variables
    let symbol: String
    let vmOp: () -> ()
    
    // MARK: - UI
    var body: some View {
        GeometryReader { geometry in
            Button {
                vmOp()
            } label: {
                Text(symbol)
                    .font(.system(size: 20.0, weight: .bold))
                    .frame(width: geometry.size.width, height: geometry.size.width) // Make the button square
            }
            .foregroundColor(Color("Text"))
            .background(.clear)
            .cornerRadius(18.0)
        }
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(symbol: "-", vmOp: {})
    }
}
