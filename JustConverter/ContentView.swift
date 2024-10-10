//
//  ContentView.swift
//  JustConverter
//
//  Created by Maxim Makarenkov on 10.10.2024.
//

import SwiftUI

struct ContentView: View {
    //@State var unitTypeSelection = UnitType.temperature(.celsius)
    @Binding var unit: Unit
    @Binding var outUnit: Unit
    var body: some View {
        NavigationStack {
            VStack {
                Picker(selection: $unit.unitType) {
                    ForEach(nestedUnitType.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                    }
                } label: {
                    Text("Choose")
                }
                .padding()
                .pickerStyle(.segmented)
                TabView(selection: $unit.unitType) {
                    ConvertView(unit: $unit, outUnit: $outUnit)
                        .tabItem { Text("Convert") }
                        .tag(nestedUnitType.temperature(.celsius))
                    ConvertView(unit: $unit, outUnit: $outUnit)
                        .tabItem { Text("Convert") }
                        .tag(nestedUnitType.currency(.usd))
                    ConvertView(unit: $unit, outUnit: $outUnit)
                        .tabItem { Text("Convert") }
                        .tag(nestedUnitType.distance(.m))
                    ConvertView(unit: $unit, outUnit: $outUnit)
                        .tabItem { Text("Convert") }
                        .tag(nestedUnitType.time(.m))
                }
                .onChange(of: unit.unitType) { _, newValue in
                    unit.unitType = newValue
                    outUnit.unitType = newValue
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .never))
                
            }
            .navigationTitle(unit.unitType.rawValue.capitalized)
        }
    }
}

#Preview {
    ContentView(unit: Binding<Unit>( get: { .init(unitType: .distance(.m), value: 150) }, set: { _ in }), outUnit: Binding<Unit>( get: { .init(unitType: .distance(.km), value: 100) }, set: { _ in }))
}
