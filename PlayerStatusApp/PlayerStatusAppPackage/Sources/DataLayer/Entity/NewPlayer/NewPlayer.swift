//
//  Player.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/11.
//

import Foundation
import SwiftData

@Model
public class NewPlayer: Identifiable {
    public var id = UUID().uuidString
    public var name: String
    
    // 基本情報
    public var basicInfoList: [BasicInfo]
    
    // 能力
    public var fieldersBasicAbilities: [BasicAbility] // 野手能力
    public var fieldersSpecialAbilities: [NewSpecialAbility] // 野手特殊能力
    
    public var pitchersBasicAbilities: [BasicAbility] // 投手能力
    public var pitchersSpecialAbilities: [NewSpecialAbility] // 投手能力

    
    public init(
        name: String,
        basicInfoList: [BasicInfo],
        fieldersBasicAbilities: [BasicAbility],
        fieldersSpecialAbilities: [NewSpecialAbility],
        pitchersBasicAbilities: [BasicAbility],
        pitchersSpecialAbilities: [NewSpecialAbility]
    ) {
        self.name = name
        self.basicInfoList = basicInfoList
        self.fieldersBasicAbilities = fieldersBasicAbilities
        self.fieldersSpecialAbilities = fieldersSpecialAbilities
        self.pitchersBasicAbilities = pitchersBasicAbilities
        self.pitchersSpecialAbilities = pitchersSpecialAbilities
    }
}
