//
//  Player.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/11.
//

import Foundation
import SwiftData

@Model
class Player: Identifiable {
    let id = UUID().uuidString
    
    // 基本情報
    var name: String
    var abilities: [Player.Ability] // 基本能力
    var specialAbilities: [Player.SpecialAbility] // 特殊能力
    
    init(name: String, abilities: [Player.Ability], specialAbilities: [Player.SpecialAbility]) {
        self.name = name
        self.abilities = abilities
        self.specialAbilities = specialAbilities
    }
    
    init() {
        self.name = ""
        self.abilities = []
        self.specialAbilities = []
    }
}
