//
//  PreviewPlayerView.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/12.
//

import SwiftUI
import SwiftData
import DataLayer

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
            }
            .fullScreenCover(isPresented: self.$showEditPlayerView, onDismiss: {
                print("dismis EditPlayerView")
            }, content: {
                EditPlayerView(player: self.player)
            })
        }
    }
}

struct PreviewPlayerViewWrapper: View {
    var body: some View {
        let player = Player(name: "名前", abilities: [
            Player.Ability(name: "開発・設計", score: 92)
        ], specialAbilities: [
            Player.SpecialAbility(name: "iOSアプリ開発", color: .blue)
        ])
        
        PreviewPlayerView(player: player)
            .modelContainer(for: Player.self)
    }
}

#Preview {
    PreviewPlayerViewWrapper()
}
