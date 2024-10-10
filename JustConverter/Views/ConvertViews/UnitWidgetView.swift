//
//  UnitWidgetView.swift
//  BLYAD
//
//  Created by Maxim Makarenkov on 07.10.2024.
//

import SwiftUI

struct UnitWidgetView: View {
    @Binding var unit: Unit
    //@State var selectedUnit: nestedUnitType
    var body: some View {
        HStack {
            TextField("Value", value: $unit.value, format: .number)
                .font(.largeTitle)
                .bold()
                .keyboardType(.decimalPad)
            Picker(selection: $unit.unitType) {
                switch unit.unitType {
                case .distance(let unit):
                    ForEach(type(of: unit).allCases, id: \.self) { distance in
                        Text(distance.rawValue)
                    }
                case .temperature(let unit):
                    ForEach(type(of: unit).allCases, id: \.self) { distance in
                        Text(distance.rawValue)
                    }
                case .currency(let unit):
                    ForEach(type(of: unit).allCases, id: \.self) { distance in
                        Text(distance.rawValue)
                    }
                case .time(let unit):
                    ForEach(type(of: unit).allCases, id: \.self) { distance in
                        Text(distance.rawValue)
                    }
                }
            } label: {
                Text("Choose unit")
            }
            .pickerStyle(.segmented)
        }
        .padding()
        
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 15, x: 0, y: 0)
    }
}

#Preview {
    UnitWidgetView(unit: Unit.MOCK_UNIT)
}
