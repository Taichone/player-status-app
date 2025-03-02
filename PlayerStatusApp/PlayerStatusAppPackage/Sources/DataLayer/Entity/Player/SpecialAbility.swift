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
    public var rank: Rank
    
    public init(
        name: String = "",
        color: Color = .skyBlue,
        rank: Self.Rank = .none
    ) {
        self.name = name
        self.color = color
        self.rank = rank
    }
    
    public enum Color: String, CaseIterable, Codable, Sendable {
        case skyBlue
        case blue
        case blueAndRed
        case red
        case yellow
        case green
    }
    
    public enum Rank: String, CaseIterable, Codable, Sendable {
        case s, a, b, c, d, e, f, g, none
    }
}
