//
//  Operation.swift
//  SwiftCalcul
//
//  Created by tristepin222 on 15.03.2024.
//
import SwiftUI

enum OperationType {
    case add, subtract, multiply, divide, equal, none
}

enum ButtonType: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"

    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(UIColor(red: 80/255.0, green: 80/255.0, blue: 80/255.0, alpha: 1))
        default:
            return Color(UIColor(red: 120/255.0, green: 120/255.0, blue: 120/255.0, alpha: 1))
        }
    }
}

struct Operation {
    var operationType: OperationType
    var buttonType: ButtonType
}


