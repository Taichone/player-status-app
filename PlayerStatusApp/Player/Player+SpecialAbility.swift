//
//  Player+SpecialAbility.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/12.
//

import Foundation

extension Player {
    struct SpecialAbility: Identifiable, Codable {
        var id = UUID().uuidString
        var name: String
        var color: Self.Color
        
        init(name: String, color: Self.Color) {
            self.name = name
            self.color = color
        }
        
        enum Color: String, CaseIterable, Codable {
            case blue
            case green
            case yellow
            case red
            case emptyColor
            
            static let defaultColor = Self.blue
        }
    }
}
