//
//  Player+Ability.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/12.
//

import Foundation

public struct NewBasicAbility: Codable, Identifiable {
    public var id = UUID().uuidString
    public var name: String
    public var score: Int {
        didSet {
            self.updateRank()
        }
    }
    public private(set) var rank: Self.Rank
    
    public init(name: String, score: Int) {
        self.name = name
        self.score = score
        self.rank = .g
        self.updateRank()
    }
    
    private mutating func updateRank() {
        switch self.score {
        case 90...:
            self.rank = .s
        case 80..<90:
            self.rank = .a
        case 70..<80:
            self.rank = .b
        case 60..<70:
            self.rank = .c
        case 50..<60:
            self.rank = .d
        case 40..<50:
            self.rank = .e
        case 30..<40:
            self.rank = .f
        default:
            self.rank = .g
        }
    }
    
    public enum Rank: Codable {
        case s, a, b, c, d, e, f, g
    }
}
