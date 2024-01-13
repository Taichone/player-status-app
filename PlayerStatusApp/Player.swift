//
//  Player.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/11.
//

import SwiftUI

struct Player {
    // 基本情報
    private(set) var name: String
    private(set) var infoBottomLeft = Self.InfoItem()
    private(set) var infoTop = Self.InfoItem()
    private(set) var infoBottomCenter = Self.InfoItem()
    private(set) var infoBottomRight = Self.InfoItem()
    
    private(set) var abilities: [Self.Ability] // 基本能力
    private(set) var specialAbilities: [Self.SpecialAbility] // 特殊能力
    
    /// 基本情報のセット
    mutating func setInfoItem(name: String, value: String, position: Self.InfoItem.Position) {
        switch position {
        case .bottomLeft:
            self.infoBottomLeft = InfoItem(name: name, value: value)
        case .top:
            self.infoTop = InfoItem(name: name, value: value)
        case .bottomCenter:
            self.infoBottomCenter = InfoItem(name: name, value: value)
        case .bottomRight:
            self.infoBottomRight = InfoItem(name: name, value: value)
        }
    }
    
    /// 基本情報の構造体
    struct InfoItem {
        enum Position {
            case bottomLeft, top, bottomCenter, bottomRight
        }
        
        var name = ""
        var value = ""
    }
}
