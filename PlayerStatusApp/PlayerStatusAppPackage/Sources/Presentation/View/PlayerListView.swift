//
//  Untitled.swift
//  PlayerStatusAppPackage
//
//  Created by Taichi on 2025/03/02.
//

import SwiftUI
import SwiftData
import DataLayer

public struct PlayerListView: View {
    @State private var players: [Player]
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    public init(players: [Player]) {
        self._players = State(initialValue: players)
    }
    
    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(players) { player in
                    PlayerCell(player: player)
                        .frame(height: 60)
                        .shadow(radius: 4)
                }
            }
            .padding()
        }
        .navigationTitle("選手一覧")
    }
}

#Preview {
    PlayerListView(players: [
        Player.make(name: "一宮", backgroundColors: [.yellow]),
        Player.make(name: "二岡", backgroundColors: [.green, .yellow]),
        Player.make(name: "三木", backgroundColors: [.red, .blue]),
        Player.make(name: "四谷", backgroundColors: [.pink, .red]),
        Player.make(name: "五十嵐", backgroundColors: [.yellow]),
        Player.make(name: "六郷", backgroundColors: [.red, .pink, .green]),
        Player.make(name: "七里ヶ浜", backgroundColors: [.green]),
        Player.make(name: "八田", backgroundColors: [.pink, .blue, .green]),
        Player.make(name: "九里", backgroundColors: [.pink]),
        Player.make(name: "十番町", backgroundColors: [.red]),
        Player.make(name: "名前長杉野郎鯉津マジKAYO", backgroundColors: [.red]),
    ])
}

extension Player {
    static func make(
        name: String,
        backgroundColors: [BackgroundColor]
    ) -> Player {
        return .init(
            name: name,
            backgroundColors: backgroundColors,
            basicInfoList: [],
            fieldersBasicAbilities: [],
            fieldersSpecialAbilities: [],
            pitchersBasicAbilities: [],
            pitchersSpecialAbilities: []
        )
    }
}
