//
//  PlayerListView.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/14.
//

import SwiftUI

struct PlayerListView: View {
    @EnvironmentObject var playersManager: PlayersManager
    private let columns = [GridItem(.adaptive(minimum: 100, maximum: 300))]
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(Color.abilityCellColor)
                    .shadow(radius: 3)
                ScrollView {
                    LazyVGrid(columns: self.columns, alignment: .center, spacing: 10, pinnedViews: .sectionFooters ) {
                        ForEach(self.playersManager.players, id: \.id) { player in
                            PlayerListViewCell(id: player.id)
                                .environmentObject(self.playersManager)
                                .onTapGesture {
                                    self.path.append(player.id)
                                }
                        }
                    }
                    .padding()
                } // ScrollView
                .clipped()
            } // ZStack
            .navigationTitle("プレイヤーリスト")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationDestination(for: String.self, destination: { id in
                PreviewPlayerView(id: id)
            })
        } // NavigationStack
    }
}

struct PlayerListViewCell: View {
    @EnvironmentObject var playersManager: PlayersManager
    let id: String
    
    var body: some View {
        let playerName = self.playersManager.players.first(where: { $0.id == self.id })?.name ?? ""
        RoundedRectangle(cornerRadius: 5)
            .aspectRatio(3 / 1, contentMode: .fit)
            .foregroundColor(Color.white)
            .shadow(radius: 3)
            .clipped()
            .shadow(radius: 3)
            .overlay {
                GeometryReader { geometry in
                    let geoWidth = geometry.size.width
                    let geoHeight = geometry.size.height
                    
                    VStack {
                        Spacer(minLength: 0)
                        HStack {
                            Spacer(minLength: 0)
                            Text(playerName)
                            .foregroundStyle(.black)
                            .font(.system(size: geoHeight * 0.5))
                            .bold()
                            .lineLimit(1)
                            .frame(width: geoWidth * 0.9) // 枠内に収める
                            .fixedSize(horizontal: false, vertical: true)
                            .minimumScaleFactor(0.1)
                            Spacer(minLength: 0)
                        } // HStack
                        Spacer(minLength: 0)
                    }
                } // GeometryReader
            } // PlayerListViewCell.overlay
    }
}

#Preview {
    PlayerListView()
        .environmentObject(PlayersManager())
}
