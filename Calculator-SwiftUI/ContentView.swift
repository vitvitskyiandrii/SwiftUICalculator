//
//  ContentView.swift
//  Calculator-SwiftUI
//
//  Created by Andrii Vitvitskyi on 03/04/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    @State var total: String = ""


    var body: some View {

        VStack {
            TotalText(value: total)
            ButtonsGrid(total: $total)
                .padding(16)

        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
