//
//  Unit.swift
//  BLYAD
//
//  Created by Maxim Makarenkov on 07.10.2024.
//

import Foundation
import SwiftUI

protocol IUnit {
    mutating func convert(to unit: inout Self)
}

//enum UnitType: Hashable, CaseIterable {
//    static var allCases: [UnitType] = [.temperature(.celsius), .currency(.usd), .distance(.m), .time(.m)]
//    
//    case temperature(TemperatureType)
//    case currency(CurrencyType)
//    case distance(DistanceType)
//    case time(TimeType)
//}
//
//enum TemperatureType: String, CaseIterable {
//    case celsius
//    case fahrenheit
//    
//    static var base: Self { .celsius }
//}
//
//enum CurrencyType: String, CaseIterable {
//    case usd
//    case eur
//    
//    static var base: Self { .usd }
//}
//
//enum DistanceType: String, CaseIterable {
//    case km
//    case m
//    
//    static var base: Self { .m }
//}
//
//enum TimeType: String, CaseIterable {
//    case s
//    case m
//    case h
//    
//    static var base: Self { .m }
//}
//
struct Unit: IUnit {
    var unitType: nestedUnitType
    var value: Double = 0
    
    mutating func convert(to unit: inout Unit) {
        let baseValue = convertToBaseUnit()
        switch unit.unitType {
        case .temperature(let temperatureType):
            switch temperatureType {
            case .celsius:
                unit.value = baseValue
            case .fahrenheit:
                unit.value = (baseValue - 32) * 5 / 9
           }
        case .currency(let currencyType):
            switch currencyType {
            case .usd:
                unit.value = baseValue
            case .eur:
                unit.value = baseValue * 0.85
           }
        case .distance(let distanceType):
            switch distanceType {
            case .km:
                unit.value = baseValue / 1000
            case .m:
                unit.value = baseValue
            }
        case .time(let timeType):
            switch timeType {
            case .s:
                unit.value = baseValue * 60
            case .m:
                unit.value = baseValue
            case .h:
                unit.value = baseValue / 60
            }
        }
    }
    
}

extension Unit {
    mutating func convertToBaseUnit() -> Double {
        switch self.unitType {
        case .temperature(let temperatureType):
            switch temperatureType {
            case .celsius:
                return self.value
            case .fahrenheit:
                return self.value * 9 / 5 + 32
            }
        case .currency(let currencyType):
            switch currencyType {
            case .usd:
                return self.value
            case .eur:
                return self.value * 0.85
            }
        case .distance(let distanceType):
            switch distanceType {
            case .km:
                return self.value * 1000
            case .m:
                return self.value
            }
        case .time(let timeType):
            switch timeType {
            case .s:
                return self.value / 60
            case .h:
                return self.value * 60
            case .m:
                return self.value
            }
        }
    }
}
//
//extension UnitType: RawRepresentable {
//    
//    public init?(rawValue: RawValue) {
//        switch rawValue {
//        case "temperature":
//            self = .temperature(.celsius)
//        case "currency":
//            self = .currency(.usd)
//        case "distance":
//            self = .distance(.m)
//        case "time":
//            self = .time(.m)
//        default:
//            return nil
//        }
//    }
//    
//    public var rawValue: String {
//        switch self {
//        case .currency: return "currency"
//        case .temperature: return "temperature"
//        case .distance: return "distance"
//        case .time: return "time"
//        }
//    }
//}

enum nestedUnitType: Hashable, CaseIterable {
    
    case temperature(TemperatureType)
    case currency(CurrencyType)
    case distance(DistanceType)
    case time(TimeType)

    static var allCases: [nestedUnitType] = [.temperature(.base), .currency(.base), .distance(.base), .time(.base)]
    
    enum TemperatureType: String, CaseIterable {
        case celsius
        case fahrenheit

        static var base: Self { .celsius }
    }

    enum CurrencyType: String, CaseIterable {
        case usd
        case eur

        static var base: Self { .usd }
    }

    enum DistanceType: String, CaseIterable {
        case km
        case m

        static var base: Self { .m }
    }

    enum TimeType: String, CaseIterable {
        case s
        case m
        case h

        static var base: Self { .m }
    }
}

extension nestedUnitType: RawRepresentable {
    
    public init?(rawValue: RawValue) {
        switch rawValue {
        case "temperature":
            self = .temperature(.celsius)
        case "currency":
            self = .currency(.usd)
        case "distance":
            self = .distance(.m)
        case "time":
            self = .time(.m)
        default:
            return nil
        }
    }
    
    public var rawValue: String {
        switch self {
        case .currency: return "currency"
        case .temperature: return "temperature"
        case .distance: return "distance"
        case .time: return "time"
        }
    }
}

extension Unit {
    static var MOCK_UNIT = Binding<Unit>( get: { .init(unitType: .distance(.m), value: 150) }, set: { _ in })
    static var MOCK_OUTUNIT = Binding<Unit>( get: { .init(unitType: .distance(.km), value: 100) }, set: { _ in })
}
