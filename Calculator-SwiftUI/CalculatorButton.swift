//
//  CalculatorButton.swift
//  Calculator-SwiftUI
//
//  Created by Andrii Vitvitskyi on 03/04/2025.
//

import SwiftUI

struct CalculatorButton: View {

    var title: String = "1"
    var width: CGFloat = 70
    var color = Color(hue: 1.0, saturation: 0, brightness: 0.283)
    var action: (_ buttobuttonDidTapn: CalculatorButton) -> Void = {button in }
    var mode: Mode = .notSet

    var body: some View {
        Button(action: {
            action(self)
        }, label: {
            Text(title)
                .font(.largeTitle)
                .frame(width: width, height: 70, alignment: .center)
                .background(color)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        })
    }
}

#Preview {
    CalculatorButton()
}
