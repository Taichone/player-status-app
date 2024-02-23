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
        var name: String {
            didSet {
                self.updateColorIfNeeded()
            }
        }
        var color: Self.Color {
            didSet {
                self.updateColorIfNeeded()
            }
        }
        
        init(name: String, color: Color) {
            self.name = name
            self.color = color
            self.updateColorIfNeeded()
        }
        
        private mutating func updateColorIfNeeded() {
            let str = self.name.trimmingCharacters(in: .whitespaces)
            if str.isEmpty {
                self.color = .emptyColor
            } else if self.color == .emptyColor {
                self.color = .defaultColor
            }
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
