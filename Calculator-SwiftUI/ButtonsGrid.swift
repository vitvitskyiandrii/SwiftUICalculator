//
//  ButtonsGrid.swift
//  Calculator-SwiftUI
//
//  Created by Andrii Vitvitskyi on 03/04/2025.
//

import SwiftUI

struct ButtonsGrid: View {

    @Binding var total: String
    @State var currentMode: Mode = .notSet
    @State var lastButtonWasMode: Bool = false
    @State var savedInt: Int = 0
    @State var currentInt: Int = 0

    var body: some View {
        Grid {
            GridRow {
                CalculatorButton(title: "1", action: buttonDidTap)
                CalculatorButton(title: "2", action: buttonDidTap)
                CalculatorButton(title: "3", action: buttonDidTap)
                CalculatorButton(title: "+", color: .orange, action: modeButtonDidTap, mode: .addition)
            }
            GridRow {
                CalculatorButton(title: "4", action: buttonDidTap)
                CalculatorButton(title: "5", action: buttonDidTap)
                CalculatorButton(title: "6", action: buttonDidTap)
                CalculatorButton(title: "-", color: .orange, action: modeButtonDidTap, mode: .subtraction)
            }
            GridRow {
                CalculatorButton(title: "7", action: buttonDidTap)
                CalculatorButton(title: "8", action: buttonDidTap)
                CalculatorButton(title: "9", action: buttonDidTap)
                CalculatorButton(title: "x", color: .orange, action: modeButtonDidTap, mode: .multiplication)
            }
            GridRow {
                CalculatorButton(title: "0", width: 147, action: buttonDidTap)
                    .gridCellColumns(2)
                CalculatorButton(title: "c", color: .gray, action: clearButtonDidTap)
                CalculatorButton(title: "=", color: .orange, action: equalButtonDidTap)
            }
        }
    }

    func buttonDidTap(button: CalculatorButton) {
        if lastButtonWasMode {
            lastButtonWasMode = false
            currentInt = 0
        }

        guard let totalInt = Int("\(currentInt)" + button.title) else {
            currentInt = 0
            total = "Error"
            return
        }
        currentInt = totalInt
        updateText()
    }

    func modeButtonDidTap(button: CalculatorButton) {
        currentMode = button.mode
        lastButtonWasMode = true
    }

    func clearButtonDidTap(button: CalculatorButton) {
        total = "0"
        currentMode = .notSet
        lastButtonWasMode = false
        savedInt = 0
        currentInt = 0
    }

    func equalButtonDidTap(button: CalculatorButton) {
        print("equa button did tap")
        if currentMode == .notSet || lastButtonWasMode {
            return
        }
        switch currentMode {
        case .notSet:
            break
        case .addition:
            savedInt += currentInt
        case .subtraction:
            savedInt -= currentInt
        case .multiplication:
            savedInt *= currentInt
        }
        currentInt = savedInt
        updateText()
        lastButtonWasMode = true
    }

    func updateText() {
        if currentMode == .notSet {
            savedInt = currentInt
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        total = formatter.string(for: currentInt) ?? "Error"
    }
}

#Preview {
    ButtonsGrid(total: .constant("1"))
}
