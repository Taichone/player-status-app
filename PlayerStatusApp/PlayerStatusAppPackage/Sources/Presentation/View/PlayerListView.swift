//
//  Untitled.swift
//  PlayerStatusAppPackage
//
//  Created by Taichi on 2025/03/02.
//

import DataLayer
import Domain
import SwiftUI

public struct PlayerListView: View {
    @State private var viewModel: PlayerListViewModel

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    public init(players: [Player]) {
        viewModel = .init(players: players)
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(
                    Array(viewModel.players.enumerated()),
                    id: \.element.id
                ) { index, player in
                    playerCellView(player: player)
                }
            }
            .padding()
        }
        .navigationTitle("選手一覧")
    }
    
    @ViewBuilder
    private func playerCellView(player: Player) -> some View {
        PlayerCell(player: player)
            .frame(height: 60)
            .shadow(radius: 4)
            .opacity(
                viewModel.draggedItem?.id == player.id ? 0.5 : 1.0
            )
            .draggable(player) {
                PlayerCell(player: player)
                    .contentShape(
                        .dragPreview,
                        .rect(cornerRadius: PlayerCell.cornerRadius)
                    )
                    .onAppear {
                        viewModel.draggedItem = player
                    }
            }
            .dropDestination(for: Player.self) { _, _ in
                true
            } isTargeted: { isTargeted in
                handleDropTarget(isTargeted: isTargeted, targetPlayer: player)
            }
    }
    
    private func handleDropTarget(isTargeted: Bool, targetPlayer: Player) {
        // ターゲットがない時は何もしない
        guard isTargeted else { return }
        // ドラッグしてない時は何もしない
        guard let draggingItem = viewModel.draggedItem else {
            return
        }
        // ドラッグ中のIDとターゲットのIDが一緒であれば何もしない
        guard draggingItem.id != targetPlayer.id else {
            return
        }
        
        performDragOperation(draggingItem: draggingItem, targetPlayer: targetPlayer)
    }
    
    private func performDragOperation(draggingItem: Player, targetPlayer: Player) {
        // ドラッグ中のインデックス
        guard let draggingItemIndex = viewModel.players.firstIndex(
            where: { $0.id == draggingItem.id })
        else {
            return
        }
        // ターゲットのインデックス
        guard let targetedItemIndex = viewModel.players.firstIndex(
            where: { $0.id == targetPlayer.id })
        else {
            return
        }

        withAnimation {
            let sourceItem = viewModel.players.remove(
                at: draggingItemIndex
            )
            viewModel.players.insert(
                sourceItem, at: targetedItemIndex
            )
        }
    }
}

extension Player: Transferable {
    public static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: { player in
            // Playerオブジェクトを識別するためのIDを返す
            return player.id
        })
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
        Player.make(name: "名前がとても長い人", backgroundColors: [.red]),
        Player.make(name: "名前がめちゃくちゃ長い人", backgroundColors: [.red]),
        Player.make(name: "アインシュタイン", backgroundColors: [.red]),
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
