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
    @Published var runningNumber = 0

    var pastOperation: ButtonType = .equal
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
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .subtract {
                self.operation.operationType = .subtract
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .multiply {
                self.operation.operationType = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide {
                self.operation.operationType = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
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
        case .decimal, .negative, .percent:
            break
        default:
            let number = button.rawValue
            if pastOperation == .equal {
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
