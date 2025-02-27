//
//  Player.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/11.
//

import Foundation
import SwiftData

@Model
public class Player: Identifiable {
    public var id = UUID().uuidString
    
    // 基本情報
    public var name: String
    public var abilities: [Player.Ability] // 基本能力
    public var specialAbilities: [Player.SpecialAbility] // 特殊能力
    
    public init(name: String, abilities: [Player.Ability], specialAbilities: [Player.SpecialAbility]) {
        self.name = name
        self.abilities = abilities
        self.specialAbilities = specialAbilities
    }
    
    public init() {
        self.name = ""
        self.abilities = []
        self.specialAbilities = []
    }
}
