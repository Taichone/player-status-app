//
//  PlayerListView.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/14.
//

import SwiftUI
import SwiftData

struct PlayerListView: View {
    @Environment(\.modelContext) private var context
    @Query var players: [Player]
    private let columns = [GridItem(.adaptive(minimum: 80, maximum: 200))]
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(self.players, id: \.id) { player in
                    NavigationLink(destination: PreviewPlayerView(player: player), label: { Text(player.name).bold() })
                }
                .onDelete(perform: self.playerRowRemove)
            }
            .navigationTitle("プレイヤーリスト")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        let newPlayer = Player()
                        newPlayer.name = "新規プレイヤー"
                        self.context.insert(newPlayer)
                    }, label: {
                        Image(systemName: "plus")
                    })
                })
            }
        } // NavigationStack
    }
    
    private func playerRowRemove(offsets: IndexSet) {
        for index in offsets {
            let removingPlayer = self.players[index]
            self.context.delete(removingPlayer)
        }
        try? self.context.save()
    }
}
