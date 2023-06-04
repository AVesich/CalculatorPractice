//
//  Calculator.swift
//  Calculator
//
//  Created by Austin Vesich on 5/31/23.
//

import Foundation

struct Calculator {
    
    // MARK: - Declaring Variables
    var numStr: String {
        return getNumString(number: num)
    }
    
    // Number variables
    var mainNum: Decimal? {
        didSet {
            guard mainNum != nil else { return } // Only reset attributes if the number is not initially null
            carryingNegative = false // Becomes false once a value is set to prevent the string and the number both being negative. carryingNegative is simply to show -0 when necessary.
            carryingDecimal = false // Make the string show a decimal if the number itself doesn't yet
            carryingZeroCount = 0 // Reset the count of 0s when the number is changed; The number isn't updated when 0s are added, so we can reset the variable here.
            clearPressedOnce = false // Clear being pressed once no longer matters if the number has changed
        }
    }
    var expression: Expression?
    var calculatedNum: Decimal?
    private var num: Decimal? {
        if clearPressedOnce || carryingDecimal { // Show 0 if clear has been pressed or if a decimal is entered, regardless of expression or calculation. If either of these is pressed, we want to illustrate to the user that they are entering a new number.
            return mainNum
        }
        return mainNum ?? expression?.firstNum ?? calculatedNum
    }
    
    // Attribute variables
    private var carryingNegative: Bool = false
    private var carryingDecimal: Bool = false
    private var containsDecimal: Bool {
        return getNumString(number: num).contains(".")
    }
    private var carryingZeroCount: Int = 0 // Count how many 0s are currently inputted after the decimal, as the Decimal class automatically simplifies. Example: 2.300 -> 2.3
    private var clearPressedOnce: Bool = false
    var allClear: Bool {
        mainNum == nil && expression == nil && calculatedNum == nil || clearPressedOnce // If we already have nothing, or if we have pressed clear once already
    }
            
    // MARK: - Calculator functions
    // Button presses
    mutating func addDigit(_ digit: Digit) {
        if containsDecimal && digit == .zero {
            carryingZeroCount += 1
        } else if canInputDigit(digit) {
            mainNum = Decimal(string: getNumString(number: mainNum).appending(digit.description) )
        }
    }
    mutating func clearAll() { // Clear all variables including expressions
        mainNum = nil
        expression = nil
        calculatedNum = nil
        carryingNegative = false
        carryingDecimal = false
        carryingZeroCount = 0
    }
    mutating func clear() { // Clear only the current number
        mainNum = nil
        carryingNegative = false
        carryingDecimal = false
        carryingZeroCount = 0
        
        clearPressedOnce = true
    }
    mutating func toggleNegative() {
        if let num = mainNum {
            mainNum = -num
            return
        }
        
        if let num = calculatedNum {
            calculatedNum = -num
            return
        }
        
        carryingNegative.toggle() // Only toggle the carrying variable if there is no number typed or calculated so that the string will instead show -0 to simply indicate the negative being active
    }
    mutating func pct() {
        if let num = mainNum {
            mainNum = num/100
        }
        else if let num = calculatedNum {
            calculatedNum = num/100
        }
    }
    mutating func decimal() {
        // If we contain the decimal in the string already (it is in the number or carrying), do nothing; otherwise, carry it for now.
        if containsDecimal {
            return
        }
        
        carryingDecimal = true
    }
    mutating func sqrt() {
        guard let num = num else { return }
        let exp = Expression(firstNum: 0, operation: .SQRT)
        mainNum = exp.operate(withNumber: num)
    }
    mutating func selectOperation(_ operation: Expression.Operation) {
        guard var num = mainNum ?? calculatedNum else { return } // If nothing has been calculated or typed yet, no operation can begin
        
        // Operate again if an operation button is pressed with an existing expresison entered. This occurs when expression has not been set to nil within operate yet.
        if let prevExpression = expression {
            num = prevExpression.operate(withNumber: num)
        }
        
        // Create a new expression with the current number in the calculator and the entered operation
        expression = Expression(firstNum: num, operation: operation) // num is passed into the expression here because operations should operate on any number present in the field at the time
        mainNum = nil // Reset the main number so the second number can be entered
    }
    mutating func operate() {
        guard let num = mainNum, let currExpression = expression else { return }
        calculatedNum = currExpression.operate(withNumber: num) // Store the calculated number
        expression = nil
        mainNum = nil // Set the main number to nil so that the calculated number is displayed
    }
    
    // Util
    private func getNumString(number: Decimal?, withCommas: Bool = false) -> String {
        var string = (withCommas ? number?.formatted(.number) : number.map(String.init)) ?? "0"
        
        if carryingNegative { string.insert("-", at: string.startIndex) }
        if carryingDecimal { string.append(".") }
        if carryingZeroCount > 0 { string.append(String(repeating: "0", count: carryingZeroCount)) }
        
        return string
    }
    private func canInputDigit(_ digit: Digit) -> Bool {
        return num != nil || digit != .zero
    }
}
