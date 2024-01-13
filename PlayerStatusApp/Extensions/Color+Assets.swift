//
//  Color+Assets.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/11.
//

import SwiftUI

extension Color {
    /// rank color (S, A, B, C, D, E, F, G)
    struct Rank {
        static let sColor = Color("rankSColor")
        static let aColor = Color("rankAColor")
        static let bColor = Color("rankBColor")
        static let cColor = Color("rankCColor")
        static let dColor = Color("rankDColor")
        static let eColor = Color("rankEColor")
        static let fColor = Color("rankFColor")
        static let gColor = Color("rankGColor")
    }
    
    /// special ability background color
    struct SpecialAbility {
        static let blue = Color("specialAbilityBlue")
        static let green = Color("specialAbilityGreen")
        static let yellow = Color("specialAbilityYellow")
        static let red = Color("specialAbilityRed")
        static let emptyColor = Color("specialAbilityEmptyColor")
        
        struct Text {
            static let blue = Color("specialAbilityTextBlue")
            static let green = Color("specialAbilityTextGreen")
            static let yellow = Color("specialAbilityTextYellow")
            static let red = Color("specialAbilityTextRed")
        }
    }
    
    static let abilityCellColor = Color("abilityCellColor")
}
