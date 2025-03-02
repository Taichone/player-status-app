//
//  PlayerListViewModel.swift
//  PlayerStatusAppPackage
//
//  Created by Taichi on 2025/03/02.
//

import DataLayer
import Foundation
import Observation

@MainActor @Observable public final class PlayerListViewModel {
    public var players: [Player]
    public var draggedItem: Player?
    
    public init(players: [Player]) {
        self.players = players
    }
    
    // ドラッグ開始時の処理
    public func startDragging(player: Player) {
        self.draggedItem = player
    }
    
    // ドロップ完了時の処理
    public func dropCompleted() {
        draggedItem = nil
    }
    
    // ドロップ位置が変更された時の処理
    public func moveItem(from sourceIndex: Int, to destinationIndex: Int) {
        // 同じ位置にドロップする場合は何もしない
        if sourceIndex == destinationIndex {
            return
        }
        
        // 配列内の要素を移動
        let player = players.remove(at: sourceIndex)
        players.insert(player, at: sourceIndex > destinationIndex ? destinationIndex : destinationIndex - 1)
    }
    
    // プレイヤーの並び順を更新する処理
    public func updatePlayerOrder(draggedItem: Player, destinationIndex: Int) {
        guard let sourceIndex = players.firstIndex(where: { $0.id == draggedItem.id }) else {
            return
        }
        
        moveItem(from: sourceIndex, to: destinationIndex)
    }
}
