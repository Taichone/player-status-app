//
//  BasicInfo.swift
//  PlayerStatusAppPackage
//
//  Created by Taichi on 2025/03/02.
//

import Foundation

public struct BasicInfo: Identifiable, Codable, Sendable {
    public var id = UUID().uuidString
    public var name: String
    public var content: String
    
    public init(name: String = "", content: String = "") {
        self.name = name
        self.content = content
    }
}
