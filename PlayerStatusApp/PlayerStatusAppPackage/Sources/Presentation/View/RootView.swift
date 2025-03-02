//
//  RootView.swift
//  PlayerStatusAppPackage
//
//  Created by Taichi on 2025/03/02.
//

import SwiftUI
import DataLayer

public struct RootView: View {
    public init() {}
    
    public var body: some View {
        PlayerListView(players: [
            Player.make(name: "一宮", backgroundColors: [.yellow]),
            Player.make(name: "二岡", backgroundColors: [.green, .yellow]),
            Player.make(name: "三木", backgroundColors: [.red, .blue]),
            Player.make(name: "四谷", backgroundColors: [.pink, .red]),
            Player.make(name: "五十嵐", backgroundColors: [.yellow]),
            Player.make(name: "六郷", backgroundColors: [.red, .pink, .green]),
            Player.make(name: "七里ヶ浜", backgroundColors: [.green]),
            Player.make(name: "八田", backgroundColors: [.pink, .blue, .green]),
            Player.make(name: "九里", backgroundColors: [.pink]),
            Player.make(name: "十番町", backgroundColors: [.red]),
        ])
    }
}

#Preview {
    RootView()
}
