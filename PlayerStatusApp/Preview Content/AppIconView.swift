//
//  AppIconView.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/13.
//

import SwiftUI

#Preview {
    AppIconView()
}

fileprivate struct AppIconView: View {
    var body: some View {
        Rectangle()
            .frame(width: 300, height: 300)
            .foregroundStyle(Color.white)
            .border(Color.black)
            .overlay {
                VStack(spacing: 15) {
                    SpecialAbilitiesViewDummyCell(color: Color(red: 1, green: 0.4, blue: 0.6))
                    HStack(spacing: 10) {
                        AbilitiesViewDummyCell(ability: Player.Ability(name: "-", score: 90))
                            .frame(width: 70, height: 100)
                        VStack(spacing: 15) {
                            SpecialAbilitiesViewDummyCell(color: Color(red: 1, green: 1, blue: 0))
                            SpecialAbilitiesViewDummyCell(color: Color(red: 0, green: 1, blue: 0.7))
                        }
                    }
                    .frame(width: 200, height: 92.5)
                    SpecialAbilitiesViewDummyCell(color: Color(red: 0.4, green: 0.8, blue: 1))
                }
                .frame(width: 200, height: 200)
            }
    }
}

fileprivate struct SpecialAbilitiesViewDummyCell: View {
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(self.color)
            .shadow(radius: 2)
    }
}

fileprivate struct AbilitiesViewDummyCell: View {
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
        RankText(rank: self.ability.rank)
            .stroke(color: .white)
            .font(.system(size: 100))
            .bold()
            .clipped()
            .shadow(radius: 2)

//        RoundedRectangle(cornerRadius: 10)
//            .aspectRatio(1, contentMode: .fit)
//            .foregroundColor(Color.white)
//            .overlay {
//                GeometryReader { geometry in
//                    let geoHeight = geometry.size.height
//                    
//                    VStack {
//                        Spacer(minLength: 0)
//                        HStack {
//                            Spacer(minLength: 0)
//                            RankText(rank: self.ability.rank)
//                                .stroke(color: .white)
//                                .font(.system(size: 80))
//                                .bold()
//                                .clipped()
//                                .shadow(radius: 4)
//                            Spacer(minLength: 0)
//                        } // HStack
//                        Spacer(minLength: 0)
//                    }
//                } // GeometryReader
//            } // RoundedRectangle.overlay
    } // body
}

