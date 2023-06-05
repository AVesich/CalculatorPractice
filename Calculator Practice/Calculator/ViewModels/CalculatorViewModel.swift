//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Austin Vesich on 6/2/23.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    
    // MARK: - Declaring Variables
    // Calculator instance
    @Published var calculator = Calculator()
    
    var numStr: String { // Since calculator is published, this field automatically is
        calculator.numStr
    }
    var currentOperation: Expression.Operation? {
        calculator.expression?.operation
    }
    
    // Buttons
    var operations: [[CalculatorOperation]] {
        let clearText = calculator.allClear ? "AC" : "C"
        return [
            [ CalculatorOperation(symbol: clearText, operation: .CLEAR),    CalculatorOperation(symbol: "+-", operation: .NEGATIVE),        CalculatorOperation(symbol: "%", operation: .PERCENT),          CalculatorOperation(symbol: "/", operation: .OPERATION(.DIVIDE)) ],
            [ CalculatorOperation(symbol: "7", operation: .DIGIT(.seven)),  CalculatorOperation(symbol: "8", operation: .DIGIT(.eight)),    CalculatorOperation(symbol: "9", operation: .DIGIT(.nine)),     CalculatorOperation(symbol: "x", operation: .OPERATION(.MULTIPLY)) ],
            [ CalculatorOperation(symbol: "4", operation: .DIGIT(.four)),   CalculatorOperation(symbol: "5", operation: .DIGIT(.five)),     CalculatorOperation(symbol: "6", operation: .DIGIT(.six)),      CalculatorOperation(symbol: "-", operation: .OPERATION(.SUBTRACT)) ],
            [ CalculatorOperation(symbol: "1", operation: .DIGIT(.one)),    CalculatorOperation(symbol: "2", operation: .DIGIT(.two)),      CalculatorOperation(symbol: "3", operation: .DIGIT(.three)),    CalculatorOperation(symbol: "+", operation: .OPERATION(.ADD)) ],
            [ CalculatorOperation(symbol: "0", operation: .DIGIT(.zero)),   CalculatorOperation(symbol: ".", operation: .DECIMAL),          CalculatorOperation(symbol: "√", operation: .SQRT),             CalculatorOperation(symbol: "=", operation: .EQUALS) ]
        ]
    }
    
    // MARK: - Funcs
    func perform (_ operation: CalculatorOperation.ButtonOperation) {
        switch operation {
        case .DIGIT(let digit):
            calculator.addDigit(digit)
            break
        case .OPERATION(let operation):
            calculator.selectOperation(operation)
            break
        case .SQRT:
            calculator.sqrt()
            break
        case .PERCENT:
            calculator.pct()
            break
        case .DECIMAL:
            calculator.decimal()
            break
        case .NEGATIVE:
            calculator.toggleNegative()
            break
        case .CLEAR:
            calculator.allClear ? calculator.clearAll() : calculator.clear()
            break
        case .EQUALS:
            calculator.operate()
            break
        }
    }
}
