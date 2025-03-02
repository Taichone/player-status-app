//
//  Player+Ability.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/12.
//

import Foundation

public protocol AbilityListItem: Codable, Sendable {
    var name: String { get set }
}

public struct BasicAbility: AbilityListItem {
    public var name: String
    public var score: Int {
        didSet {
            rank = Self.getRank(score: score)
        }
    }
    public private(set) var rank: Rank
    
    public init(name: String = "", score: Int = 0) {
        self.name = name
        self.score = score
        self.rank = Self.getRank(score: score)
    }
    
    private static func getRank(score: Int) -> Rank {
        switch score {
        case 90...100:
            return .s
        case 80..<90:
            return .a
        case 70..<80:
            return .b
        case 60..<70:
            return .c
        case 50..<60:
            return .d
        case 40..<50:
            return .e
        case 30..<40:
            return .f
        case 0..<30:
            return .g
        default:
            // logic failure
            fatalError("Invalid score: (0...100)")
        }
    }
    
    public enum Rank: Codable, Sendable {
        case s, a, b, c, d, e, f, g
    }
}

// 弾道
public struct Trajectory: AbilityListItem {
    public var name: String
    public var rank: Rank
    
    public enum Rank: Codable, Sendable {
        case a, b, c, d
    }
}

// 守備力
public struct DefensiveAbilities: AbilityListItem {
    public var name: String
    public var abilities: [BasicAbility]
}

// 球速
public struct FastestPitch: AbilityListItem {
    public var name: String
    public var speed: Int
}

// 球種
public struct PitchTypes: AbilityListItem {
    public var name: String
    
    public var top1: StraightType?
    public var top2: StraightType?
    public var right1: BreakingBallType?
    public var right2: BreakingBallType?
    public var bottomRight1: BreakingBallType?
    public var bottomRight2: BreakingBallType?
    public var bottom1: BreakingBallType?
    public var bottom2: BreakingBallType?
    public var bottomLeft1: BreakingBallType?
    public var bottomLeft2: BreakingBallType?
    public var left1: BreakingBallType?
    public var left2: BreakingBallType?
    
    public struct StraightType: Codable, Sendable {
        public var name: String
    }
    
    public struct BreakingBallType: Codable, Sendable {
        public var name: String
        public var amount: Amount
        
        public enum Amount: Codable, Sendable {
            case one, two, three, four, five, six, seven
        }
    }
}
