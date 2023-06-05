//
//  OperationChip.swift
//  Calculator
//
//  Created by Austin Vesich on 6/4/23.
//

import SwiftUI

struct OperationChip: View {
    
    // MARK: - Declaring Variables
    let operation: Expression.Operation?
    
    // MARK: - UI
    var body: some View {
        if let op = operation {
            Text(op.rawValue + "   " + op.description)
                .font(.system(size: 14.0, weight: .bold))
                .foregroundColor(Color("Text"))
                .padding(.vertical, 6.0)
                .padding(.horizontal, 14.0)
                .background(.black.opacity(0.5))
                .cornerRadius(14.0)
        }
    }
}

struct OperationChip_Previews: PreviewProvider {
    static var previews: some View {
        OperationChip(operation: .ADD)
    }
}
