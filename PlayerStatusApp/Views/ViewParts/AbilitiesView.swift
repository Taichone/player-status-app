//
//  AbilitiesView.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/12.
//

import SwiftUI

struct AbilitiesView: View {
    let abilities: [Player.Ability]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(Color.abilityCellColor)
                .shadow(radius: 3)
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
    typealias Ability = Player.Ability
    
    private static let abilities: [Ability] = [
        Ability(name: "ミート", score: 80),
        Ability(name: "パワー", score: 69),
        Ability(name: "走力", score: 72),
    ]
    
    var body: some View {
        AbilitiesView(abilities: Self.abilities)
    }
}

#Preview {
    AbilitiesViewWrapper()
}
