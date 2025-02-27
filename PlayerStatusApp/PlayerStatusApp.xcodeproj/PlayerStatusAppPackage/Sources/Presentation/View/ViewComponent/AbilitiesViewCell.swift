//
//  AbilitiesViewCell.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/11.
//

import SwiftUI
import DataLayer

struct AbilitiesViewCell: View {
    let ability: Player.Ability
    
    private struct RankText: View{
        let rank: Player.Ability.Rank
        
        var body: some View {
            switch self.rank {
            case .s: Text("S").foregroundStyle(Color.Rank.sColor)
            case .a: Text("A").foregroundStyle(Color.Rank.aColor)
            case .b: Text("B").foregroundStyle(Color.Rank.bColor)
            case .c: Text("C").foregroundStyle(Color.Rank.cColor)
            case .d: Text("D").foregroundStyle(Color.Rank.dColor)
            case .e: Text("E").foregroundStyle(Color.Rank.eColor)
            case .f: Text("F").foregroundStyle(Color.Rank.fColor)
            case .g: Text("G").foregroundStyle(Color.Rank.gColor)
            }
        }
    }
    
    var body: some View {
            RoundedRectangle(cornerRadius: 5)
                .aspectRatio(8 / 1, contentMode: .fit)
                .foregroundColor(Color.white)
            .overlay(alignment: .leading) {
                GeometryReader { geometry in
                    let geoWidth = geometry.size.width
                    let geoHeight = geometry.size.height
                    
                    VStack {
                        Spacer(minLength: 0)
                        HStack(spacing: geoWidth * 0.01) {
                            RoundedRectangle(cornerRadius: 5)
                                .shadow(radius: 2)
                                .foregroundColor(Color.white)
                                .frame(width: geoWidth * 0.7, height: geoHeight * 0.8)
                                .padding(.leading, geoHeight * 0.1)
                                .overlay {
                                    HStack {
                                        Text(self.ability.name)
                                            .foregroundStyle(.black)
                                            .font(.system(size: geoHeight * 0.5))
                                            .bold()
                                            .lineLimit(1)
                                            .frame(width: geoWidth * 0.67) // 枠内に収める
                                            .fixedSize(horizontal: false, vertical: true)
                                            .minimumScaleFactor(0.1)
                                    }
                                }
                            RankText(rank: self.ability.rank)
                                .stroke(color: .white)
                                .font(.system(size: geoHeight * 0.7))
                                .bold()
                                .clipped()
                                .shadow(radius: 2)
                                .frame(width: geoWidth * 0.1)
                            Text("\(self.ability.score)")
                                .foregroundStyle(.black)
                                .frame(width: geoWidth * 0.15, alignment: .trailing)
                                .font(.system(size: geoHeight * 0.6))
                                .bold()
                        } // HStack
                        Spacer(minLength: 0)
                    }
                } // GeometryReader

            } // RoundedRectangle.overlay
            .clipped()
            .shadow(radius: 3)
    } // body
}
