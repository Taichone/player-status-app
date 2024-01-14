//
//  ContentView.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/11.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var playersManager: PlayersManager
    
    var body: some View {
        PlayerListView()
            .environmentObject(self.playersManager)
    }
}

#Preview {
    ContentView()
        .environmentObject(PlayersManager())
}
