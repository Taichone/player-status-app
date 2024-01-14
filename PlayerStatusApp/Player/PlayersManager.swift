//
//  PlayersManager.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/14.
//

import Foundation

class PlayersManager: ObservableObject {
    private(set) var players = [Player]()
    
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
