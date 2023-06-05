//
//  CalculatorOperation.swift
//  Calculator
//
//  Created by Austin Vesich on 5/31/23.
//

import Foundation

struct CalculatorOperation: Hashable {
    var symbol: String
    var operation: ButtonOperation
    
    enum ButtonOperation {
        case DIGIT(_ digit: Digit)
        case OPERATION(_ operation: Expression.Operation)
        case SQRT
        case PERCENT
        case DECIMAL
        case NEGATIVE
        case CLEAR
        case EQUALS
    }
    
    static func == (lhs: CalculatorOperation, rhs: CalculatorOperation) -> Bool {
        return lhs.symbol == rhs.symbol
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(symbol)
    }
}
