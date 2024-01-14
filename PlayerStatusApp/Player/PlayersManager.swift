//
//  PlayersManager.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/14.
//

import Foundation

class PlayersManager: ObservableObject {
    @Published var players = [
        Player(name: "鳥谷 敬", abilities: [
            Player.Ability(name: "ソフトウェア開発", score: 100),
            Player.Ability(name: "映像・デザイン", score: 87),
            Player.Ability(name: "経営・マネジメント", score: 85),
            Player.Ability(name: "生産性", score: 90),
            Player.Ability(name: "影響力", score: 80),
            Player.Ability(name: "英語力", score: 77)
        ], specialAbilities: [
            Player.SpecialAbility(name: "インテリア", color: .yellow),
            Player.SpecialAbility(name: "ライフハック", color: .yellow),
            Player.SpecialAbility(name: "俊足巧打", color: .yellow),
            Player.SpecialAbility(name: "遊撃手", color: .yellow),
            Player.SpecialAbility(name: "清潔感", color: .green),
            Player.SpecialAbility(name: "筋肉質", color: .green),
            Player.SpecialAbility(name: "クリエイティブ", color: .green),
            Player.SpecialAbility(name: "リーダーシップ", color: .green),
            Player.SpecialAbility(name: "表情豊か", color: .green),
            Player.SpecialAbility(name: "聞き上手", color: .green),
            Player.SpecialAbility(name: "低姿勢", color: .green),
            Player.SpecialAbility(name: "ポジティブ", color: .green),
            Player.SpecialAbility(name: "CS専攻", color: .blue),
            Player.SpecialAbility(name: "TOEIC 800", color: .blue),
            Player.SpecialAbility(name: "ITメガベン", color: .blue),
            Player.SpecialAbility(name: "1Mフォロワー", color: .blue),
            Player.SpecialAbility(name: "Flutter", color: .blue),
            Player.SpecialAbility(name: "Dart", color: .blue),
            Player.SpecialAbility(name: "SwiftUI", color: .blue),
            Player.SpecialAbility(name: "Swift", color: .blue)
        ]),
        Player(name: "近本 光司", abilities: [], specialAbilities: []),
        Player(name: "中野 拓夢", abilities: [], specialAbilities: []),
        Player(name: "マートン", abilities: [], specialAbilities: []),
        Player(name: "伊藤 将司", abilities: [], specialAbilities: []),
        Player(name: "大和", abilities: [], specialAbilities: []),
        Player(name: "ブラゼル", abilities: [], specialAbilities: []),
        Player(name: "木浪 聖也", abilities: [], specialAbilities: []),
        Player(name: "Shohei Ohtani", abilities: [], specialAbilities: []),
        Player(name: "近本 光司", abilities: [], specialAbilities: []),
        Player(name: "中野 拓夢", abilities: [], specialAbilities: []),
        Player(name: "マートン", abilities: [], specialAbilities: []),
        Player(name: "伊藤 将司", abilities: [], specialAbilities: []),
        Player(name: "大和", abilities: [], specialAbilities: []),
        Player(name: "ブラゼル", abilities: [], specialAbilities: []),
        Player(name: "木浪 聖也", abilities: [], specialAbilities: []),
        Player(name: "Shohei Ohtani", abilities: [], specialAbilities: []),
        Player(name: "近本 光司", abilities: [], specialAbilities: []),
        Player(name: "中野 拓夢", abilities: [], specialAbilities: []),
        Player(name: "マートン", abilities: [], specialAbilities: []),
        Player(name: "伊藤 将司", abilities: [], specialAbilities: []),
        Player(name: "大和", abilities: [], specialAbilities: []),
        Player(name: "ブラゼル", abilities: [], specialAbilities: []),
        Player(name: "木浪 聖也", abilities: [], specialAbilities: []),
        Player(name: "Shohei Ohtani", abilities: [], specialAbilities: []),
        Player(name: "近本 光司", abilities: [], specialAbilities: []),
        Player(name: "中野 拓夢", abilities: [], specialAbilities: []),
        Player(name: "マートン", abilities: [], specialAbilities: []),
        Player(name: "伊藤 将司", abilities: [], specialAbilities: []),
        Player(name: "大和", abilities: [], specialAbilities: []),
        Player(name: "ブラゼル", abilities: [], specialAbilities: []),
        Player(name: "木浪 聖也", abilities: [], specialAbilities: []),
        Player(name: "Shohei Ohtani", abilities: [], specialAbilities: []),
        Player(name: "近本 光司", abilities: [], specialAbilities: []),
        Player(name: "中野 拓夢", abilities: [], specialAbilities: []),
        Player(name: "マートン", abilities: [], specialAbilities: []),
        Player(name: "伊藤 将司", abilities: [], specialAbilities: []),
        Player(name: "大和", abilities: [], specialAbilities: []),
        Player(name: "ブラゼル", abilities: [], specialAbilities: []),
        Player(name: "木浪 聖也", abilities: [], specialAbilities: []),
        Player(name: "Shohei Ohtani", abilities: [], specialAbilities: []),
        Player(name: "近本 光司", abilities: [], specialAbilities: []),
        Player(name: "中野 拓夢", abilities: [], specialAbilities: []),
        Player(name: "マートン", abilities: [], specialAbilities: []),
        Player(name: "伊藤 将司", abilities: [], specialAbilities: []),
        Player(name: "大和", abilities: [], specialAbilities: []),
        Player(name: "ブラゼル", abilities: [], specialAbilities: []),
        Player(name: "木浪 聖也", abilities: [], specialAbilities: []),
        Player(name: "Shohei Ohtani", abilities: [], specialAbilities: []),
        Player(name: "超長井名前野 読見ニクイ名前ヤノウ", abilities: [], specialAbilities: [])
    ]
    
    let name = "マートン"
    
    func addPlayer(player: Player) {
        self.players.append(player)
    }
    
    func deletePlayer(id: String) {
        if let index = self.players.firstIndex(where: { $0.id == id }) {
            self.players.remove(at: index)
        }
    }
    
    func updatePlayer(id: String, to newValue: Player) {
        if let index = self.players.firstIndex(where: { $0.id == id }) {
            self.players[index] = newValue
        }
    }
}
