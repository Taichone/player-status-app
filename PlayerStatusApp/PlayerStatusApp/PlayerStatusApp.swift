//
//  PlayerStatusApp.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/11.
//

import SwiftUI
import Presentation
import OldDataLayer

@main
struct PlayerStatusAppApp: App {
    var body: some Scene {
        WindowGroup {
            PlayerListView()
                .modelContainer(for: Player.self)
        }
    }
}
