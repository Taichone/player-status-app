//
//  Player.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/11.
//

import Foundation

public struct Player: Codable, Identifiable {
    public var id = UUID().uuidString
    public var name: String
    public var backgroundColors: [BackgroundColor]
    
    // 基本情報
    public var basicInfoList: [BasicInfo]
    
    // 野手能力
    public var fieldersBasicAbilities: [BasicAbility] // 野手能力
    public var fieldersSpecialAbilities: [SpecialAbility] // 野手特殊能力
    
    // 投手能力
    public var pitchersBasicAbilities: [BasicAbility] // 投手能力
    public var pitchersSpecialAbilities: [SpecialAbility] // 投手能力

    
    public init(
        name: String,
        backgroundColors: [BackgroundColor],
        basicInfoList: [BasicInfo],
        fieldersBasicAbilities: [BasicAbility],
        fieldersSpecialAbilities: [SpecialAbility],
        pitchersBasicAbilities: [BasicAbility],
        pitchersSpecialAbilities: [SpecialAbility]
    ) {
        self.name = name
        self.backgroundColors = backgroundColors
        self.basicInfoList = basicInfoList
        self.fieldersBasicAbilities = fieldersBasicAbilities
        self.fieldersSpecialAbilities = fieldersSpecialAbilities
        self.pitchersBasicAbilities = pitchersBasicAbilities
        self.pitchersSpecialAbilities = pitchersSpecialAbilities
    }
    
    public enum BackgroundColor: CaseIterable, Codable, Sendable {
        case green, yellow, blue, pink, red
    }
}
