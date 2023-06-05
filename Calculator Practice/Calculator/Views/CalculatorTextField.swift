//
//  CalculatorTextField.swift
//  Calculator
//
//  Created by Austin Vesich on 5/31/23.
//

import SwiftUI

struct CalculatorTextField: View {

    var text: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 22.0)
                .fill(.white.opacity(0.1))
            Text(text)
                .font(.system(size: 42.0, weight: .semibold))
                .foregroundColor(Color("Text"))
                .padding(24.0)
        }
        .compositingGroup()
    }
}

struct CalculatorTextField_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorTextField(text: "0")
    }
}
