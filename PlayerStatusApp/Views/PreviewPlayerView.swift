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
    @State private var showEditPlayerView = false
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
        .toolbar {
            ToolbarItem(placement: .topBarTrailing, content: {
                Button(action: {
                    self.showEditPlayerView = true
                }, label: {
                    Text("編集")
                })
            })
            ToolbarItem(placement: .bottomBar, content: {
                HStack {
                    Spacer()
                    Button(action: {
                        self.showEditPlayerView = true
                    }, label: {
                        Image(systemName: "trash")
                    })
                }
            })
        }
    }
}

struct PreviewPlayerViewWrapper: View {
    var body: some View {
        let playersManager = PlayersManager()
        PreviewPlayerView(id: playersManager.players.randomElement()?.id ?? "")
            .environmentObject(playersManager)
    }
}

#Preview {
    PlayerListView()
        .environmentObject(PlayersManager())
}
