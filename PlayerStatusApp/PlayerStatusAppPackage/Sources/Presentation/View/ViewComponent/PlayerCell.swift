//
//  SpecialAbilitiesViewCell.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/12.
//

import DataLayer
import SwiftUI

public struct PlayerCell: View {
    let player: Player

    public var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(backgroundStyle())
                .aspectRatio(4, contentMode: .fit)
                .overlay(
                    Text(player.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .padding(.horizontal, 8)
                )
        }
        .cornerRadius(10)
    }

    private func backgroundStyle() -> LinearGradient {
        var colors: [Color] = []
        for backgroundColor in player.backgroundColors {
            switch backgroundColor {
            case .green:
                colors.append(.green)
            case .yellow:
                colors.append(.yellow)
            case .blue:
                colors.append(.blue)
            case .red:
                colors.append(.red)
            case .pink:
                colors.append(.pink)
            }
        }

        if let firstColor = colors.first,
            let lastColor = colors.last
        {
            colors.insert(firstColor, at: 0)
            colors.append(lastColor)
        }

        return LinearGradient(
            gradient: Gradient(colors: colors), startPoint: .leading,
            endPoint: .trailing
        )
    }
}

#Preview {
    HStack {
        PlayerCell(
            player: .init(
                name: "近本",
                backgroundColors: [.blue, .pink],
                basicInfoList: [],
                fieldersBasicAbilities: [],
                fieldersSpecialAbilities: [],
                pitchersBasicAbilities: [],
                pitchersSpecialAbilities: [])
        )
        PlayerCell(
            player: .init(
                name: "名前がすごく長い人",
                backgroundColors: [.blue, .pink],
                basicInfoList: [],
                fieldersBasicAbilities: [],
                fieldersSpecialAbilities: [],
                pitchersBasicAbilities: [],
                pitchersSpecialAbilities: [])
        )
        PlayerCell(
            player: .init(
                name: "鳥谷",
                backgroundColors: [.blue, .pink],
                basicInfoList: [],
                fieldersBasicAbilities: [],
                fieldersSpecialAbilities: [],
                pitchersBasicAbilities: [],
                pitchersSpecialAbilities: [])
        )
    }
}
