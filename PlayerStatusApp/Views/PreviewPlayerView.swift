//
//  PreviewPlayerView.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/01/12.
//

import SwiftUI
import SwiftData

struct PreviewPlayerView: View {
    @Environment(\.horizontalSizeClass) var hSizeClass
    @Environment(\.verticalSizeClass) var vSizeClass
    @State private var showEditPlayerView = false
    let player: Player
    
    var body: some View {
        let deviceTraitStatus = DeviceTraitStatus(hSizeClass: self.hSizeClass, vSizeClass: self.vSizeClass)
        
        NavigationStack {
            GeometryReader { geometry in
                let geoWidth = geometry.size.width
                
                switch deviceTraitStatus {
                case .wRhR, .wRhC, .wChC:
                    HStack {
                        AbilitiesView(abilities: self.player.abilities)
                            .frame(width: geoWidth * 0.4)
                        SpecialAbilitiesView(specialAbilities: self.player.specialAbilities, columnCount: 4)
                    }.padding()
                case .wChR:
                    ScrollView {
                        AbilitiesView(abilities: self.player.abilities)
                            .padding(.horizontal)
                        SpecialAbilitiesView(specialAbilities: self.player.specialAbilities, columnCount: 2)
                            .padding(.horizontal).padding(.bottom)
                    }
                }
            }
            .navigationTitle(self.player.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        self.showEditPlayerView = true
                    }, label: {
                        Text("編集")
                    })
                })
            }
            .fullScreenCover(isPresented: self.$showEditPlayerView, onDismiss: {
                print("dismis EditPlayerView")
            }, content: {
                EditPlayerView(player: self.player)
            })
        }
    }
}

struct EditSpecialAbilityView: View {
    @Binding var specialAbility: Player.SpecialAbility
    
    var body: some View {
        List {
            Section("特殊能力名", content: {
                TextField("特殊能力名", text: self.$specialAbility.name)
            })
            Section("カラー", content: {
                Picker("", selection: self.$specialAbility.color) {
                    ForEach([
                        Player.SpecialAbility.Color.blue,
                        Player.SpecialAbility.Color.green,
                        Player.SpecialAbility.Color.yellow,
                        Player.SpecialAbility.Color.red
                    ], id: \.self) { (color) in
                        //rawValueの値をPickerの項目に表示
                        Text(color.rawValue).tag(color)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
            })
        }
    }
}

struct EditAbilityView: View {
    @Binding var ability: Player.Ability
    
    var body: some View {
        List {
            Section("能力名", content: {
                TextField("能力名", text: self.$ability.name)
            })
            Section("スコア", content: {
                Picker("", selection: self.$ability.score) {
                    ForEach(0...100, id: \.self) {
                        Text("\($0)")
                    }
                }.pickerStyle(WheelPickerStyle())
            })
        }
    }
}

struct EditPlayerView: View {
    private struct ModalStatus {
        var target = Target.ability("")
        var showModal = false
        
        enum Target {
            typealias ID = String
            case ability(ID)
            case specialAbility(ID)
        }
    }
    
    let player: Player
    @State private var name = ""
    @State private var abilities = [Player.Ability]()
    @State private var specialAbilities = [Player.SpecialAbility]()
    @State private var modalStatus = Self.ModalStatus()
    @Environment(\.dismiss) var dismiss
    private let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationStack {
            List {
                Section("選手名", content: {
                    TextField("選手名", text: self.$name)
                })
                
                Section("能力", content: {
                    ForEach(self.$abilities.indices, id: \.self) { index in
                        NavigationLink(
                            destination: EditAbilityView(ability: self.$abilities[index]),
                            label: { Text(self.abilities[index].name) }
                        )
                    }
                    .onDelete(perform: self.abilitiesRowRemove)
                    
                    Button(action: {
                        self.abilities.append(Player.Ability(name: "", score: 0))
                    }, label: { Text("能力を追加") })
                })
                
                Section("特殊能力", content: {
                    ForEach(self.$specialAbilities.indices, id: \.self) { index in
                        NavigationLink(
                            destination: EditSpecialAbilityView(specialAbility: self.$specialAbilities[index]),
                            label: { Text(self.specialAbilities[index].name) }
                        )
                    }
                    .onDelete(perform: self.specialAbilitiesRowRemove)
                    
                    Button(action: {
                        self.specialAbilities.append(Player.SpecialAbility(name: "", color: .blue))
                    }, label: { Text("特殊能力を追加") })
                })
            }
            .navigationTitle(self.player.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(action: { self.dismiss() }, label: { Text("キャンセル") })
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        self.player.name = self.name
                        self.player.abilities = self.abilities
                        self.player.specialAbilities = self.specialAbilities
                        self.dismiss()
                    }, label: { Text("完了") })
                })
            }
        }
        .onAppear(perform: {
            self.name = self.player.name
            self.abilities = self.player.abilities
            self.specialAbilities = self.player.specialAbilities
        })
    }
    
    private func abilitiesRowRemove(offsets: IndexSet) {
        self.abilities.remove(atOffsets: offsets)
    }
    
    private func specialAbilitiesRowRemove(offsets: IndexSet) {
        self.specialAbilities.remove(atOffsets: offsets)
    }
}

struct PreviewPlayerViewWrapper: View {
    var body: some View {
        let player = Player(name: "三木 太智", abilities: [
            Player.Ability(name: "開発・設計", score: 92),
            Player.Ability(name: "映像・デザイン", score: 85),
            Player.Ability(name: "経営・マネジメント", score: 87),
            Player.Ability(name: "影響力", score: 72),
            Player.Ability(name: "生産性", score: 90),
            Player.Ability(name: "仕事力", score: 85),
            Player.Ability(name: "英語力", score: 77)
        ], specialAbilities: [
            Player.SpecialAbility(name: "名古屋大", color: .yellow),
            Player.SpecialAbility(name: "経営者", color: .yellow),
            Player.SpecialAbility(name: "エンジニア", color: .yellow),
            Player.SpecialAbility(name: "クリエイター", color: .yellow),
            Player.SpecialAbility(name: "iOSアプリ開発", color: .blue),
            Player.SpecialAbility(name: "Androidアプリ開発", color: .blue),
            Player.SpecialAbility(name: "Webアプリ開発", color: .blue),
            Player.SpecialAbility(name: "プロダクトマネジメント", color: .blue),
            Player.SpecialAbility(name: "清潔感・筋肉質", color: .green),
            Player.SpecialAbility(name: "リーダーシップ", color: .green),
            Player.SpecialAbility(name: "初心者に優しい", color: .green),
            Player.SpecialAbility(name: "聞き上手・表情豊か", color: .green),
            Player.SpecialAbility(name: "常に前向きな言動", color: .green),
            Player.SpecialAbility(name: "功績を語らない", color: .green)
        ])
        
        PreviewPlayerView(player: player)
            .modelContainer(for: Player.self)
    }
}

#Preview {
    PreviewPlayerViewWrapper()
}
