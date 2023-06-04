//
//  NumberModels.swift
//  Calculator
//
//  Created by Austin Vesich on 6/2/23.
//

import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"
    }
}

struct Expression {
    enum Operation {
        case DIVIDE
        case MULTIPLY
        case SUBTRACT
        case ADD
        case SQRT
    }
    
    var firstNum: Decimal
    var operation: Operation
    
    func operate(withNumber number: Decimal) -> Decimal {
        switch operation {
        case .DIVIDE:
            if number == 0 { return 0 }
            else { return firstNum / number }
        case .MULTIPLY:
            return firstNum * number
        case .SUBTRACT:
            return firstNum - number
        case .ADD:
            return firstNum + number
        case .SQRT:
            return Decimal(sqrt(NSDecimalNumber(decimal: number).doubleValue))
        }
    }
}
