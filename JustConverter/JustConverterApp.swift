//
//  JustConverterApp.swift
//  JustConverter
//
//  Created by Maxim Makarenkov on 10.10.2024.
//

import SwiftUI

@main
struct BLYADApp: App {
    @State private var unit = Unit(unitType: .temperature(.celsius), value: 0)
    @State private var outUnit = Unit(unitType: .temperature(.celsius), value: 0)
    var body: some Scene {
        WindowGroup {
            ContentView(unit: $unit, outUnit: $outUnit)
        }
    }
}
