//
//  Untitled.swift
//  PlayerStatusAppPackage
//
//  Created by Taichi on 2025/03/02.
//

import SwiftUI
import DataLayer

public struct PlayerListView: View {
    @State private var players: [Player]
    @State private var draggedItem: Player?
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    public init(players: [Player]) {
        self._players = State(initialValue: players)
    }
    
    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(Array(players.enumerated()), id: \.element.id) { index, player in
                    PlayerCell(player: player)
                        .frame(height: 60)
                        .shadow(radius: 4)
                        .opacity(draggedItem?.id == player.id ? 0.5 : 1.0)
                        .onDrag {
                            self.draggedItem = player
                            return NSItemProvider(object: "\(index)" as NSString)
                        }
                        .onDrop(of: [.text], delegate: DropViewDelegate(
                            destinationIndex: index,
                            players: $players,
                            draggedItem: $draggedItem)
                        )
                }
            }
            .padding()
        }
        .navigationTitle("選手一覧")
    }
}

struct DropViewDelegate: DropDelegate {
    let destinationIndex: Int
    @Binding var players: [Player]
    @Binding var draggedItem: Player?
    
    func performDrop(info: DropInfo) -> Bool {
        draggedItem = nil
        return true
    }
    
    func dropEntered(info: DropInfo) {
        guard let draggedItem = self.draggedItem,
              let sourceIndex = players.firstIndex(where: { $0.id == draggedItem.id }) else {
            return
        }
        
        // 同じ位置にドロップする場合は何もしない
        if sourceIndex == destinationIndex {
            return
        }
        
        // 配列内の要素を移動
        withAnimation(.default) {
            let player = players.remove(at: sourceIndex)
            players.insert(player, at: sourceIndex > destinationIndex ? destinationIndex : destinationIndex - 1)
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
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
