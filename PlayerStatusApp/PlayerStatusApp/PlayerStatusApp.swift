//
//  PlayerStatusApp.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/11.
//

import SwiftUI
import Presentation
import OldPresentation

@main
struct PlayerStatusAppApp: App {
    var body: some Scene {
        WindowGroup {
            OldPlayerListView()
        }
    }
}
