//
//  EditPlayerView.swift
//  PlayerStatusApp
//
//  Created by Taichi on 2024/02/24.
//

import SwiftUI

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
                    .onMove(perform: self.abilitiesRowMove)
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
                    .onMove(perform: self.specialAbilitiesRowMove)
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
    
    private func abilitiesRowMove(from source: IndexSet, to destination: Int) {
        self.abilities.move(fromOffsets: source, toOffset: destination)
    }
    
    private func abilitiesRowRemove(offsets: IndexSet) {
        self.abilities.remove(atOffsets: offsets)
    }
    
    private func specialAbilitiesRowMove(from source: IndexSet, to destination: Int) {
        self.specialAbilities.move(fromOffsets: source, toOffset: destination)
    }
    
    private func specialAbilitiesRowRemove(offsets: IndexSet) {
        self.specialAbilities.remove(atOffsets: offsets)
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
