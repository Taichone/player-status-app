//
//  PreviewPlayerView.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/12.
//

import SwiftUI

struct PreviewPlayerView: View {
    @EnvironmentObject var playersManager: PlayersManager
    @Environment(\.horizontalSizeClass) var hSizeClass
    @Environment(\.verticalSizeClass) var vSizeClass
    let id: String

    var body: some View {
        let deviceTraitStatus = DeviceTraitStatus(hSizeClass: self.hSizeClass, vSizeClass: self.vSizeClass)
        let player = self.playersManager.players.first(where: { $0.id == self.id }) ?? Player(name: "", abilities: [], specialAbilities: [])
        
        GeometryReader { geometry in
            let geoWidth = geometry.size.width
            
            switch deviceTraitStatus {
            case .wRhR, .wRhC, .wChC:
                HStack {
                    AbilitiesView(abilities: player.abilities)
                        .frame(width: geoWidth / 3)
                    SpecialAbilitiesView(specialAbilities: player.specialAbilities, columnCount: 4)
                }.padding()
            case .wChR:
                ScrollView {
                    AbilitiesView(abilities: player.abilities)
                        .padding(.horizontal)
                    SpecialAbilitiesView(specialAbilities: player.specialAbilities, columnCount: 2)
                        .padding(.horizontal).padding(.bottom)
                }
            }
        }
        .navigationTitle(player.name)
    }
}

struct PreviewPlayerViewWrapper: View {
    typealias Ability = Player.Ability
    typealias SpecialAbility = Player.SpecialAbility
    
    private static let abilities: [Ability] = [
        Ability(name: "ソフトウェア開発", score: 100),
        Ability(name: "映像・デザイン", score: 87),
        Ability(name: "経営・マネジメント", score: 85),
        Ability(name: "生産性", score: 90),
        Ability(name: "影響力", score: 80),
        Ability(name: "英語力", score: 77)
    ]
    
    private static let specialAbilities: [SpecialAbility] = [
        SpecialAbility(name: "インテリア", color: .yellow),
        SpecialAbility(name: "ライフハック", color: .yellow),
        SpecialAbility(name: "俊足巧打", color: .yellow),
        SpecialAbility(name: "遊撃手", color: .yellow),
        SpecialAbility(name: "清潔感", color: .green),
        SpecialAbility(name: "筋肉質", color: .green),
        SpecialAbility(name: "クリエイティブ", color: .green),
        SpecialAbility(name: "リーダーシップ", color: .green),
        SpecialAbility(name: "表情豊か", color: .green),
        SpecialAbility(name: "聞き上手", color: .green),
        SpecialAbility(name: "低姿勢", color: .green),
        SpecialAbility(name: "ポジティブ", color: .green),
        SpecialAbility(name: "CS専攻", color: .blue),
        SpecialAbility(name: "TOEIC 800", color: .blue),
        SpecialAbility(name: "ITメガベン", color: .blue),
        SpecialAbility(name: "1Mフォロワー", color: .blue),
        SpecialAbility(name: "Flutter", color: .blue),
        SpecialAbility(name: "Dart", color: .blue),
        SpecialAbility(name: "SwiftUI", color: .blue),
        SpecialAbility(name: "Swift", color: .blue)
    ]
    
    var body: some View {
        let playersManager = PlayersManager()
        PreviewPlayerView(id: playersManager.players.first?.id ?? "")
            .environmentObject(playersManager)
    }
}

#Preview {
    PreviewPlayerViewWrapper()
}
