//
//  PreviewPlayerView.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/12.
//

import SwiftUI
import SwiftData

struct PreviewPlayerView: View {
    @Environment(\.horizontalSizeClass) var hSizeClass
    @Environment(\.verticalSizeClass) var vSizeClass
    @State private var showEditPlayerView = false
    let player: Player
    
    var body: some View {
        let deviceTraitStatus = DeviceTraitStatus(hSizeClass: self.hSizeClass, vSizeClass: self.vSizeClass)
        
        NavigationStack {
            GeometryReader { geometry in
                let geoWidth = geometry.size.width
                
                switch deviceTraitStatus {
                case .wRhR, .wRhC, .wChC:
                    HStack {
                        AbilitiesView(abilities: self.player.abilities)
                            .frame(width: geoWidth * 0.4)
                        SpecialAbilitiesView(specialAbilities: self.player.specialAbilities, columnCount: 4)
                    }.padding()
                case .wChR:
                    ScrollView {
                        AbilitiesView(abilities: self.player.abilities)
                            .padding(.horizontal)
                        SpecialAbilitiesView(specialAbilities: self.player.specialAbilities, columnCount: 2)
                            .padding(.horizontal).padding(.bottom)
                    }
                }
            }
            .navigationTitle(self.player.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        self.showEditPlayerView = true
                    }, label: {
                        Text("編集")
                    })
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        self.showEditPlayerView = true
                    }, label: {
                        Image(systemName: "trash")
                    })
                })
            }
            .fullScreenCover(isPresented: self.$showEditPlayerView, onDismiss: {
                print("dismis EditPlayerView")
            }, content: {
                EditPlayerView(player: self.player)
            })
        }
    }
}

struct EditPlayerView: View {
    let player: Player
    
    var body: some View {
        VStack {
            Text(self.player.name)
        }
    }
}

struct PreviewPlayerViewWrapper: View {
    var body: some View {
        let player = Player(name: "三木 太智", abilities: [
            Player.Ability(name: "開発・設計", score: 92),
            Player.Ability(name: "映像・デザイン", score: 85),
            Player.Ability(name: "経営・マネジメント", score: 87),
            Player.Ability(name: "影響力", score: 72),
            Player.Ability(name: "生産性", score: 90),
            Player.Ability(name: "仕事力", score: 85),
            Player.Ability(name: "英語力", score: 77)
        ], specialAbilities: [
            Player.SpecialAbility(name: "名古屋大", color: .yellow),
            Player.SpecialAbility(name: "経営者", color: .yellow),
            Player.SpecialAbility(name: "エンジニア", color: .yellow),
            Player.SpecialAbility(name: "クリエイター", color: .yellow),
            Player.SpecialAbility(name: "iOSアプリ開発", color: .blue),
            Player.SpecialAbility(name: "Androidアプリ開発", color: .blue),
            Player.SpecialAbility(name: "Webアプリ開発", color: .blue),
            Player.SpecialAbility(name: "プロダクトマネジメント", color: .blue),
            Player.SpecialAbility(name: "清潔感・筋肉質", color: .green),
            Player.SpecialAbility(name: "リーダーシップ", color: .green),
            Player.SpecialAbility(name: "初心者に優しい", color: .green),
            Player.SpecialAbility(name: "聞き上手・表情豊か", color: .green),
            Player.SpecialAbility(name: "常に前向きな言動", color: .green),
            Player.SpecialAbility(name: "功績を語らない", color: .green)
        ])
        
        PreviewPlayerView(player: player)
            .modelContainer(for: Player.self)
    }
}

#Preview {
    PreviewPlayerViewWrapper()
}
