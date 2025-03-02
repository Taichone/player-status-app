//
//  SpecialAbilitiesView.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/12.
//

import SwiftUI
import OldDataLayer

struct SpecialAbilitiesView: View {
    let specialAbilities: [SpecialAbility]
    let columnCount: Int
    private let columns: [GridItem]
    
    init(specialAbilities: [SpecialAbility], columnCount: Int) {
        self.specialAbilities = specialAbilities
        self.columnCount = columnCount
        self.columns = Array(repeating:
                                GridItem(
                                    .flexible(minimum: 80, maximum: 200),
                                    spacing: 10,
                                    alignment: .bottomLeading
                                ),
                             count: self.columnCount)
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(Color.abilityCellColor)
                .shadow(radius: 3)
            if self.specialAbilities.isEmpty {
                Text("特殊能力なし")
                    .bold()
                    .foregroundStyle(Color(.placeholderText))
            }
            ScrollView {
                LazyVGrid(columns: self.columns, alignment: .center, spacing: 10, pinnedViews: .sectionFooters ) {
                    ForEach(self.specialAbilities, id: \.id) { specialAbility in
                        SpecialAbilitiesViewCell(specialAbility: specialAbility)
                    }
                }
                .padding()
            }
            .clipped()
        }
    }
}

fileprivate struct SpecialAbilitiesViewWrapper: View {
    private static let specialAbilities: [SpecialAbility] = [
        .init(name: "上昇志向", color: .blue),
        .init(name: "クリエイティブ", color: .green),
        .init(name: "環境耐性", color: .yellow),
        .init(name: "上昇志向", color: .blue),
        .init(name: "環境耐性", color: .yellow),
        .init(name: "クリエイティブ", color: .green),
    ]
    
    var body: some View {
        SpecialAbilitiesView(specialAbilities: Self.specialAbilities, columnCount: 2)
    }
}

#Preview {
    SpecialAbilitiesViewWrapper()
}
