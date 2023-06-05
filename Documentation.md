# Calculator

# Goals

1. Practice making things look nice in swiftUI
2. Implement some calculus functions to practice coding advanced math functions

---

# Project layout (Initial)

## Model

none

## Views

CalculatorButton → Buttons used on the calculator

CalculatorView → The main calculator control screen

InputTextField → The text field used to show the current calculator input

## ViewModel

CalculatorViewModel → Handles calculations with input & throwing errors when necessary

---

# Project layout (Final)

## Models

Calculator → The model capable of containing & mutating data entered into the calculator

NumberModels:

  Digit → Enum for int digits 0-9

  Expression → A model containing both the first number entered into an expression and the operation for the expression

CalculatorOperation → A model containing a symbol and an operation to be executed by a button (the viewModel performs operations based on the operation for a selected button)

## Views

CalculatorButton → The buttons on the calculator

CalculatorView → The main view for the app

CalculatorTextField → The view that shows the number entered into/calculated by the calculator

OperationChip → A view that shows the operation symbol & its name

SettingsSheet → A view with background color & comma settings

## ViewModel

CalculatorViewModel → Holds array of button operations and performs operations with a calculator instance published for access by CalculatorView

## Misc

ColorExtensions → Color & String Extensions to convert colors to strings and vice-versa so that colors may be stored using @AppStorage in UserDefaults
