//
//  AbilitiesView.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/12.
//

import SwiftUI
import OldDataLayer

struct AbilitiesView: View {
    let abilities: [Ability]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(Color.abilityCellColor)
                .shadow(radius: 3)
            if self.abilities.isEmpty {
                Text("能力なし")
                    .bold()
                    .foregroundStyle(Color(.placeholderText))
            }
            ScrollView {
                ForEach(self.abilities, id: \.id) { ability in
                    AbilitiesViewCell(ability: ability)
                }
                .padding()
            }
            .clipped()
        }
    }
}

fileprivate struct AbilitiesViewWrapper: View {    
    private static let abilities: [Ability] = [
        .init(name: "ミート", score: 80),
        .init(name: "パワー", score: 69),
        .init(name: "走力", score: 72),
    ]
    
    var body: some View {
        AbilitiesView(abilities: Self.abilities)
    }
}

#Preview {
    AbilitiesViewWrapper()
}
