//
//  SpecialAbilitiesViewCell.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/12.
//

import SwiftUI
import DataLayer

struct SpecialAbilitiesViewCell: View {
    let specialAbility: Player.SpecialAbility
    let color: Color
    let textColor: Color
    
    init(specialAbility: Player.SpecialAbility) {
        self.specialAbility = specialAbility
        switch self.specialAbility.color {
        case .blue:
            self.color = Color.SpecialAbility.blue
            self.textColor = Color.SpecialAbility.Text.blue
        case .green:
            self.color = Color.SpecialAbility.green
            self.textColor = Color.SpecialAbility.Text.green
        case .yellow:
            self.color = Color.SpecialAbility.yellow
            self.textColor = Color.SpecialAbility.Text.yellow
        case .red:
            self.color = Color.SpecialAbility.red
            self.textColor = Color.SpecialAbility.Text.red
        case .emptyColor:
            self.color = Color.SpecialAbility.emptyColor
            self.textColor = Color.white
        }
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .aspectRatio(4 / 1, contentMode: .fit)
            .foregroundColor(self.color)
            .shadow(radius: 3)
            .overlay {
                Text(self.specialAbility.name)
                    .foregroundStyle(self.textColor)
                    .bold()
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                    .padding(2)
            }
    }
}
