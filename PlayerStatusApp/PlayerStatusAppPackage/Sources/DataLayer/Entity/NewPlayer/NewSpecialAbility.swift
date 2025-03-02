//
//  Player+SpecialAbility.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/12.
//

import Foundation

public struct NewSpecialAbility: Identifiable, Codable {
    public var id = UUID().uuidString
    public var name: String
    public var color: Self.Color
    
    public init(name: String, color: Self.Color) {
        self.name = name
        self.color = color
    }
    
    public enum Color: String, CaseIterable, Codable, Sendable {
        case blue
        case green
        case yellow
        case red
        case emptyColor
        
        public static let defaultColor = Self.blue
    }
}
