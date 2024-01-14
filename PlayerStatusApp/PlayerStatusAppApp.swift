//
//  PlayerStatusAppApp.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/11.
//

import SwiftUI

@main
struct PlayerStatusAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PlayersManager())
        }
    }
}
