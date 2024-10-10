//
//  ConvertView.swift
//  BLYAD
//
//  Created by Maxim Makarenkov on 07.10.2024.
//

import SwiftUI

struct ConvertView: View {
    //@Binding var unitType: nestedUnitType
    @Binding var unit: Unit
    @Binding var outUnit: Unit
    var body: some View {
        VStack {
            UnitWidgetView(unit: $unit)
                .padding()
                .padding(.top)
            Button("Swap units", systemImage: "rectangle.2.swap", action: {})
                    .labelStyle(.titleAndIcon)
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    .tint(.blue)
            UnitWidgetView(unit: $outUnit)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    ConvertView(unit: Unit.MOCK_UNIT, outUnit: Unit.MOCK_OUTUNIT)
}
