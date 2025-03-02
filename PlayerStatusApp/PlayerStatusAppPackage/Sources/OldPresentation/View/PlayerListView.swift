//
//  PlayerListView.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/14.
//

import SwiftUI
import SwiftData
import OldDataLayer

public struct OldPlayerListView: View {
    public init() {}
    
    public var body: some View {
        PlayerListView()
            .modelContainer(for: Player.self)
    }
}

public struct PlayerListView: View {
    @Environment(\.modelContext) private var context
    @Query var players: [Player]
    private let columns = [GridItem(.adaptive(minimum: 80, maximum: 200))]
    @State private var path = NavigationPath()
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(self.players, id: \.id) { player in
                    NavigationLink(destination: PreviewPlayerView(player: player), label: { Text(player.name).bold() })
                }
                .onDelete(perform: self.playerRowRemove)
            }
            .navigationTitle("選手リスト")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        self.context.insert(Player())
                    }, label: {
                        Image(systemName: "plus")
                    })
                })
            }
            .overlay {
                if self.players.isEmpty {
                    Text("右上のボタンから選手を作成しましょう")
                }
            }
        }
    }
    
    private func playerRowRemove(offsets: IndexSet) {
        for index in offsets {
            let removingPlayer = self.players[index]
            self.context.delete(removingPlayer)
        }
        try? self.context.save()
    }
}
