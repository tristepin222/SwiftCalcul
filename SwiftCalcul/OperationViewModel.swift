//
//  OperationViewModel.swift
//  SwiftCalcul
//
//  Created by tristepin222 on 15.03.2024.
//

import SwiftUI

class OperationViewModel: ObservableObject {
    @Published var operation: Operation
    
    @Published var value = "0"
    var runningNumber = 0.0

    var pastOperation: ButtonType = .equal
    var isNegative = false
    
    let buttons: [[ButtonType]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    init(operation: Operation){
        self.operation = operation
    }
    
    func updateOperationType(operationType: OperationType){
        operation.operationType = operationType
    }
    
    func didTap(button: ButtonType) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.operation.operationType = .add
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .subtract {
                self.operation.operationType = .subtract
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .multiply {
                self.operation.operationType = .multiply
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .divide {
                self.operation.operationType = .divide
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Double(self.value) ?? 0
            switch self.operation.operationType {
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .none:
                    break
            default: self.value = "0"
                }
            }
            
            if button != .equal {
                self.value = "0"
                
            }
        case .clear:
            self.value = "0"
            self.runningNumber = 0
        case .decimal:
            self.value = "\(self.value)\(".")"
            break
        case .negative:

            if !self.isNegative {
                self.value =  String(-(Double(self.value) ?? 0))
                self.isNegative = true
            }else{
                self.value =  String(value)
                self.isNegative = false
            }

            break
        case .percent:
            self.value = "\((Double(self.value) ?? 0)*100)"
            break
        default:
            let number = button.rawValue
            if pastOperation == .equal || pastOperation == .negative || pastOperation == .percent{
                value = ""
            }
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
        pastOperation = button
    }
}
